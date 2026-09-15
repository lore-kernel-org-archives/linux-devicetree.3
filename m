Received: from mail-qv2-f25.google.com (mail-qv2-f25.google.com [74.125.230.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923914C4F6B
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 18:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789497745; cv=none; b=DtLveimqKLLdGdFWpffBdWM7gVcCgIVGMMeCJFL9N/sW+b2Ap0O5SMEcHLlyfBhHwZ63IvFWPuQUz+Rxb9IjP1X4clSs5VHQ71OkDfSk4Zlz+vV4c+bp/fTNihK1NwX3ITu6rGD88xLeEyCvgOIsTASdMH2+17rPYDwE6WCPtxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789497745; c=relaxed/simple;
	bh=gUwUYd2us7GvljMhB1XTsLMxWz1EJay6or7KfXuK9ug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MiYjufCdNQNgmiC81x/kzvU8873Ik/LIeTjIjrstTlSOOMkqdm3EhIA/ufrbNkolDqlTjTeU5fve/s7s+qoxx4zMNuGhteUMMLBRziDtfV7mJtUnjKgxhZS3FjbapTw6ZVWOh5gYA9hb33bPiqsMHiSfSP+8Jf/8AkIr2mV+cm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=xjuOHKVm; arc=none smtp.client-ip=74.125.230.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="xjuOHKVm"
Received: by mail-qv2-f25.google.com with SMTP id 6a1803df08f44-90cdfcb5cb3so866076d6.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 11:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789497742; x=1790102542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JTAYgCJGuASxrvQJ9EUFo5qexb7raGjEZ25I5YC6StY=;
        b=xjuOHKVmqBnCsPg7TxLGLSIEQSuO6cVSou9zoG0wJba+akSaN/e7tU4uV/v56idFCF
         mHJ56z2aGDbkafvDcdQQBzuwwggwpIXfxMKi0qdiTr1zSCxL/swDHgnKuExX8BUZFw/7
         14WwqJvGwHuD3AqEFVAM6J3Wp6mk/Ek4ZU/l1aN79v95D081Q9TX+y3LEt2uyxe7Gq6X
         hdTtIOBf/D82zH4UmTjeSMI8hke58FDZHZ643vHGoUodzoz8io659HzQij7Vcp+pSVYM
         CSni8qaF0Be3IAcV4el5QtMoNC6qCgVKXnxekDbk1RSg3GK0ow2HzDbuif5Crn8JgFJc
         dTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789497742; x=1790102542;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JTAYgCJGuASxrvQJ9EUFo5qexb7raGjEZ25I5YC6StY=;
        b=kwsNij2O5WYy85TRPzBjuwV/SUr5uYOFC9t2/XqHHlob7B1Mn8vmet1UGqekVIYDCQ
         sNQFLiof2wM4YpjEVZh5aMldogs7p43NtSlAlGfqx6k4XprNolEiXFCUK4MPTqrTCbJQ
         OWTWmYko/FfeTIKK8Sc6V47fnTealie2zRNQxnyVq6wnbt9BjetQw2B0+hd1YFjW+sy6
         EjXVrlG5BxoC7Vkm/J+oDFUZQf2rcqHgwNZoxj4kybMo1h6bmyBhAy3bOhm3sLIlUwtR
         HSsciq3uX1r5jHERwZpQg4S1bxrSMmTtZUn5HIP0hKkLx2zetjVk4Xp7+mjJZzC9RJUa
         UdFA==
X-Forwarded-Encrypted: i=1; AKwUvByrmGoc2eIRrAx1tOxdyQxsEKq5WTdrBYymgQ5MpgFlHdzzoQCnEJF6oNFhCqGwQFQgaHvs9sSFviS7@vger.kernel.org
X-Gm-Message-State: AFuF++mifaJNZmT96xNUxvFYbcrR2xxtAJd80fH8e5+JHRPi9MFSyyt+
	xp+AqPV/6fjvsVRpbUlSZ3nPDWp/kkXUmcho4Ihm+jARe2mDWcugf/UM5GPET/iveDE=
X-Gm-Gg: AYBFou2ES613PY36Vf9LlmLVlkWmxBIT22eyHwel+9WAnnBttREryjBY2lJYw/nVMvZ
	2lYeod78Z87+R5qSjenUtNi8H8/awPVYqnIWV5lgm3fcqEW5spLGMTufEVA4NpCjVdh4GpcxTvf
	ocqM+Qc1ukAIXj+pQEy69/3q5It46HBMotTbIWl9wtKjEWaOK62VAiFgqhcj2N2iFbXW1QAqgwu
	lakEHtx6g9ZLkjly3CNaNHysm5P8oxHzGfp03bqt0mSnhf5Zfp9Y3qJTUfXE3eZ4HV8AIJXwq7I
	rZMuZeF8vItHECoy4jabRRYTcjwIgfNKNyPtSR2cD97QHqgLnXM85/uv5DcdXcRrJhVNcyNl9A5
	iAwsgeTUedtnVslPp0UE6g9bXXE2JmJKXVKqtJb0atdfBHgPv205IBLtnuuVNdmzYhDplx/GkEa
	2pRTInw7tZlCpE2AAe94OPtCWYhYaUm3gAk6jTk9XLEMPgbGSYbjBDzmGX4SirzaT0tfL+TnoM
X-Received: by 2002:a05:6214:3d0c:b0:912:2c2e:8f4d with SMTP id 6a1803df08f44-9122e4cc3bamr128277756d6.6.1789497742244;
        Tue, 15 Sep 2026 11:42:22 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123be7c43bsm5457256d6.23.2026.09.15.11.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 11:42:21 -0700 (PDT)
Message-ID: <f4af35d7-1380-43ce-b8f6-8a24efe3ddb2@riscstar.com>
Date: Tue, 15 Sep 2026 13:42:21 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: qcs6490-rb3gen2: add endpoint
 buses
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-pci@vger.kernel.org
References: <20260915181003.1633543-1-elder@riscstar.com>
 <20260915181003.1633543-4-elder@riscstar.com>
 <20260915182519.977DF1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260915182519.977DF1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/26 1:25 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] PCI endpoint dynamic ranges update fails due to static node definition
> - [Low] dtc warning: pci-ep-bus@4 unit-address lacks reg property
> --
> 
> commit 8f41aa3c7aef831e8b83dd47d6e93a9ac9228f4f
> Author: Alex Elder <elder@riscstar.com>
> 
> arm64: dts: qcom: qcs6490-rb3gen2: add endpoint buses

This Sashiko report mentions only things that were explicitly
ignored on the previous version, so I will take no action.

					-Alex

> 
> The TC9564 SoC incorporates a PCIe switch, which is connected via the second
> PCI segment (0001) on the RB3gen2 platform. The downstream port has an
> embedded PCIe endpoint that implements two PCIe functions, and this patch
> adds the devicetree nodes representing these buses.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index 3bb5fca8e2b13..5b7f5292a8864 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -955,11 +955,41 @@ pcie@3,0 {
>>   			bus-range = <0x5 0xff>;
>>   
>>   			dev@0,0 {
>> +				compatible = "pci1179,0220";
>>   				reg = <0x50000 0x0 0x0 0x0 0x0>;
>> +				#address-cells = <3>;
>> +				#size-cells = <2>;
>> +				/* Ranges will be updated dynamically */
>> +				ranges = <0x0 0x0 0x0  0x83050000 0x0 0x0  0x0 0x4000>,
>> +					 <0x2 0x0 0x0  0x83050000 0x0 0x4000  0x0 0x80000>,
>> +					 <0x4 0x0 0x0  0x83050000 0x0 0x84000  0x0 0x200000>;
> 
> [Severity: High]
> Will these ranges actually be updated dynamically during boot?
> 
> The commit message states the ranges property will be updated dynamically.
> However, the PCI quirk calls of_pci_make_dev_node() which has an early return
> if the device node is already statically defined in the device tree:
> 
>      if (pci_device_to_OF_node(pdev))
>          return;
> 
> Since dev@0,0 is defined here in the devicetree, it seems they are linked
> during initial PCI enumeration, causing the update to be skipped entirely.
> Furthermore, even if the early return was bypassed, the update uses
> __of_add_property(), which rejects existing properties with -EEXIST.
> 
> Could this leave devices on the pci-ep-bus with invalid MMIO addresses mapped
> to unassigned PCI regions?
> 
>> +
>> +				pci-ep-bus@4 {
>> +					compatible = "simple-bus";
>> +					#address-cells = <1>;
>> +					#size-cells = <1>;
>> +					/* Map 0x0-0x1fffff to BAR 4 */
>> +					ranges = <0x0  0x4 0x0 0x0  0x200000>;
>> +				};
> 
> [Severity: Low]
> Does this unit address trigger a devicetree compiler warning?
> 
> The pci-ep-bus@4 node is assigned a unit address of @4, but it lacks a
> matching reg property. According to the Devicetree specification, if a node
> uses a unit address, it must have a matching reg property.
> 
> For simple buses without a reg property, the unit address must match the
> first child address in the ranges property, which is 0x0 here, rather than 4.
> 
>>   			};
>>   
>>   			dev@0,1 {
>> +				compatible = "pci1179,0220";
>>   				reg = <0x50100 0x0 0x0 0x0 0x0>;
>> +				#address-cells = <3>;
>> +				#size-cells = <2>;
>> +				/* Ranges will be updated dynamically */
>> +				ranges = <0x0 0x0 0x0  0x83050100 0x0 0x0  0x0 0x4000>,
>> +					 <0x2 0x0 0x0  0x83050100 0x0 0x4000  0x0 0x80000>,
>> +					 <0x4 0x0 0x0  0x83050100 0x0 0x84000  0x0 0x200000>;
> 
> [Severity: High]
> As with dev@0,0 above, it appears this node might also be skipped by
> of_pci_make_dev_node() because it is statically defined. Will this prevent
> the ranges property from being dynamically updated for this second endpoint?
> 
>> +
>> +				pci-ep-bus@4 {
>> +					compatible = "simple-bus";
>> +					#address-cells = <1>;
>> +					#size-cells = <1>;
>> +					/* Map 0x0-0x1fffff to BAR 4 */
>> +					ranges = <0x0  0x4 0x0 0x0  0x200000>;
>> +				};
> 
> [Severity: Low]
> Does this second pci-ep-bus@4 node also trigger a compiler warning for
> missing a reg property while having a unit address?
> 
>>   			};
>>   		};
>>   	};
> 

