Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6763A49EC6D
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 13:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789998431; cv=none; b=Q7w+XP/bp7TH5ue/uOfPXcsSQN272lFsY852ZncqvKbJO6/y0zAUr9irBOUKDqD3uzt0wktMthrvEtQ9em2l2aHFxvUGvUMXn2sxyMmLElMDcpMFc3yL2o7k6GFCwDlPC1aZmYRGhcnvfaPHYJMa/DuZxAeui0Rj9oD5d6l+wg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789998431; c=relaxed/simple;
	bh=wExMQHi0VsEIz8YCw/Flw6gdTc2CLzrRZbI/C7wfTTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BNRobsRofsrZ6bYAid/T00LGFn6NimFMXIEg17hukX+CKD45dZAwGBhBg9ealZgwBVuWJWl/CmXhbnRx0vz7JPCOQqVjcKPqK9k9ajZ4yF1C3xtKeI07vrAzkr62Q018zKjh/Kke/SQ6ZnwPhgjod64C9T5Sxynv5KIs64Wjpy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cPzCIwA5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JK/cbkgB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cPzCIwA5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JK/cbkgB"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdtJT2091254
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 13:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qw3t/mWs9aOWgBnoW6d2vvKjBJYC5DsOvlhnmcywFhA=; b=cPzCIwA5jX3DywmU
	1HVITkOKj4B7k+UL3iJ5a56zVYzUB5jyFFP2+URe6bEr1JwwJoTZv0OprC65GVSe
	mMqLlBOmEJmaIIHljNf7/xpTZWoCOL5cZYrGy5/ZaQyLcP7hxqY7ZFrfILY2KqXA
	2a9SC1erMrqCXivYEsKbqjOuPHLIZADksb05nacccmkuORRKfTULMzYrerHqC0zf
	ZFwiQj932PHmfWymyjn+VH4sI77V6p/XC2XLR5kfq4myAFc4vDIiPSirk76mvA+/
	hhFDEtLgWWivC1d9STqdbOWNV5GziUPFPAn4Elb+2OG4Vox6wBTcsaiD87yAXE+3
	XAPRZQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3wtn4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 13:47:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb687f82eso42616715ad.3
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789998429; x=1790603229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qw3t/mWs9aOWgBnoW6d2vvKjBJYC5DsOvlhnmcywFhA=;
        b=JK/cbkgBNtCG0lPfCHrunQ+6zT4BmAZRhYaO5pjrBKlXhYzrHmzYH6pqzaiF6fwZ+A
         5w6MHGOM+CayFtGw6FS0gwcnIOugS5IMtBo7mI1aq/wljeZ8b5y8sc/7uNQpb4RWTv/I
         u2oQXwqGdMrUIQVUVX6LJPdi1dsnYvEbyeiJQd8XL8UhoBJWDxK7XpnJXhWgaHNI8BEC
         aSp2krfBMuGxrxhR0UTF2OfCppjV1+b66FsC9Ha8P5sQeXoH91BzNu8ges1E3+4DFeSj
         49ubvCyTIF3sMiqyqx6CMJRFCKpMTI8FrUR56oMiF2BiJvr2+EeTayxEcghKyDsFXgxk
         OoZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789998429; x=1790603229;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qw3t/mWs9aOWgBnoW6d2vvKjBJYC5DsOvlhnmcywFhA=;
        b=0AumPatCzM3fT7dQhy8n2XjlvDQZu8zIQnwr1+9vS9H+IKpXxcenvcVTt68VoscUR5
         D1IZ9hJJO6ZKuH68IqxPjMUF0s9LuCPDF1U45XIGCBVh38NhpkfGpUvimVJCBFmIFEM9
         dj0F3vnbkxvhtmbDnhtvMXbSAEY6knKSdFu1PAfrHjOgL/YEU9o8LH252QjmzGBxsbqY
         LyJ2kMPWxW719hUSy8rVU8UGdXeGzVovCqvr23lfcS4s1AYWNx/bxBzTkrBd3pLEQR/V
         J0SCIpLAAhMP8XgdjKJpGozh/jUlMFMYqRl4YzgaCN5d1SKr0gOzO8l/1uZaAguLFPMB
         VA2w==
X-Forwarded-Encrypted: i=1; AKwUvBxP1xh9zaTpUqkbAS3QjMIk9Ban8X3FDBdoVYOklTniRMgg2rAH8gv2g3Uzt01Jl2Ioc8M2ekEtAe71@vger.kernel.org
X-Gm-Message-State: AFuF++nS/QGqhTrBD1NrZvvIsR86ftx7JFe2ewcdRy7yJ2G9N37AiVVE
	nixHwN7MKLY+ovhgOMwAHt/MFZb/0K1IV0mdv1yENthSOAEAhAkuNkNBZu5+exYaCVZxFM8zXrw
	Q+y1cjFDksy1RrXowxhuIDVY6S19BWxC7ccw3MulUw9ubp2ZeuvPAObusHTvq+4J/
X-Gm-Gg: AYBFou1n7Idts6FnH02IQt0tTmEjOdF+JuHUGJ9vVXAsdoi0wP3mpBj3WZjxnp7lR/7
	8r3LZiCif4iZ3KVQAZ+UuWTUNFTYzG9aXtB8i5ADmGoG+cGrkUU+6Ml6gaaRD1UtsU3X+TnTVeA
	mIp5zV0o3uBH0JZmsdYhFgABo2AqjSd4mCOYTP3MaPsSUGqwWg7zjrTidJ6xtff0sMBCrlLiDo0
	8ixjyIQwWJJeFvXs4myQSPaRbEgexh/Zm1EYyrgYyadvEGfloQkWh7Fo809V8F4uzKTID+YZdgr
	Un1uu5yQ8m9GluBifUAo2jDcWe8rFo0VSrrSex+kYV72MtYqnsZaeMK1IRjuldkrUl22CwnoPrD
	yFQgQ6Vidf/0abEo14rYAPAsPqQzRv5b9JTk=
X-Received: by 2002:a17:903:2f0f:b0:2d8:d4d0:7930 with SMTP id d9443c01a7336-2ddb1b98b90mr155544045ad.20.1789998428678;
        Mon, 21 Sep 2026 06:47:08 -0700 (PDT)
X-Received: by 2002:a17:903:2f0f:b0:2d8:d4d0:7930 with SMTP id d9443c01a7336-2ddb1b98b90mr155543555ad.20.1789998428217;
        Mon, 21 Sep 2026 06:47:08 -0700 (PDT)
Received: from [192.168.29.146] ([49.43.232.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc18032d5sm34621395ad.83.2026.09.21.06.47.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 06:47:07 -0700 (PDT)
Message-ID: <7b5bec8a-87ed-4363-ac62-3e14f7619f13@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 19:17:00 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] dt-bindings: PCI: qcom,shikra-pcie: Document the
 Shikra PCIe Controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260831-shikra-upstream-v2-0-406661d75afa@oss.qualcomm.com>
 <20260831-shikra-upstream-v2-2-406661d75afa@oss.qualcomm.com>
 <20260901-silent-pearl-shrew-c63a16@quoll>
Content-Language: en-US
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <20260901-silent-pearl-shrew-c63a16@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIwMCBTYWx0ZWRfX7N+CHwQevJAw
 adDdIN+9jlSO58oNPWZG7+SdiK+WaTBYtqlFQGpFl5d6ifYkWMeZ+DpRDGlZiKnKBFjyO7N7r76
 Sqxoiure+vORkd48XSaIRzmaNosFWAXuWDNU+8UGbONsV6mU375xh92EDQwJPxz9EKO4gOqFamp
 /3SUAP8JSNwmMHSXu16vVsV8DZif+4zhWOrTlqqTdE4de+DZa4Y9sOZEuOGIYsmLUrQZPxvh3bB
 Q3nqGaaIQPfWJVIXOHbfidN/Lx3ON+O2L/1uY6u8jcaLoSiatoGgcXlTDV3fjJnSMec9uNL7eRB
 42aPiife32RUZAaweskmPAuvw0AoyQGWMDnrYKqw/TUmFZQUikiBdbXngH6dLcmbiq8ymwKRtZA
 IeYzZo+JW+Bm2+TWxwz7N8kOLnqxTBsDAQ5qJvsyyklY5K5k9haqsyBz+HGhNaunnAz01p7/dwN
 karfXRc0MwscMehQykQ==
X-Proofpoint-ORIG-GUID: tx11OZ1MrEYC7r7M4peP3rdQBJ_Lf0Yd
X-Proofpoint-GUID: tx11OZ1MrEYC7r7M4peP3rdQBJ_Lf0Yd
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab1355d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=gjxls31er4aXgMEaaoPcOA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=tLOCWTNIkaiYH31-AwAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIwMCBTYWx0ZWRfX0qlU2o2nzmFr
 QyqoBinjjXJj3ED8Sgt/7nmtcLqlXGkH42M1liAIx7HxwTUkc9417pqpUiobekOUjmr/Lww/w4r
 37amedhOhtjaBuMaEQbgGb8LGwUAnpc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210200


On 9/1/2026 2:12 PM, Krzysztof Kozlowski wrote:
> On Mon, Aug 31, 2026 at 12:56:02PM +0530, Sushrut Shree Trivedi wrote:
>> Add a dedicated schema for the PCIe controller found on the Shikra
>> platform.
>>
>> Shikra controller supports upto PCIe Gen3 but the PHY is
>> only capable of Gen2, hence the max link speed  is limited
>> to Gen2 to avoid link-up failures.
>>
>> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/pci/qcom,shikra-pcie.yaml  | 218 +++++++++++++++++++++
>>   1 file changed, 218 insertions(+)
>>
> What is the difference in the binding against Eliza? IOW, why does this
> need a separate file unlike Eliza?
Shikra does not have the Config NoC AXI clock unlike sm8550 / eliza. Apart
from that, minItems for reg  and interrupts need to be updated. I actually
didn't see any bindings with a clock constraint added for only a single 
compatible.

Do you suggest constraining shikra clock-names and other properties 
under an if
block inside sm8550 binding itself ?
>
> ...
>
>> +            reset-names = "pci";
>> +
>> +            power-domains = <&gcc GCC_PCIE_GDSC>;
>> +
>> +            max-link-speed = <2>;
>> +
>> +            operating-points-v2 = <&pcie_opp_table>;
>> +
>> +            pcie_opp_table: opp-table {
>> +                    compatible = "operating-points-v2";
> Are you sure dt-check-style does not complain?
ACK'd
>
>> +
>> +                    /* GEN 1 x1 */
>> +                    opp-2500000 {
>> +                            opp-hz = /bits/ 64 <2500000>;
>> +                            required-opps = <&rpmpd_opp_low_svs>;
>> +                            opp-peak-kBps = <250000 1>;
>> +                            opp-level = <1>;
>> +                    };
>> +
> Best regards,
> Krzysztof
