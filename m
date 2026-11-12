Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493200;
	b=oLRtB/QCg3gAOjzEhtNZzxN7Oi1haRNllbYJocELb5noU8uvji+I5o/IGbZFoEvU1LTF
	 2r/rD/b7zZC0DkGMhhepU4aSzRZQUx/Ke2l9+YYhSj6rGP7uyYbdPVPQmDtut/HVCMM5d
	 COf73SDBYgJ60HFk22g98IB1UUNLWfdyR5o3HG5b7y+0ZXyOv0PDVfbdtLD901EOU2CE9
	 K0WAUbYrErnrc+rSo+4QkQFWsWKsHzxSq+oiB89yImz8xBI5PCeSwLUjQUIQVfX0KKkyO
	 MHMywAs/n1CwjnfJTFUmnjeNUqxo2rWcib0ODszHFuT9Q9osKWuGHwj4t2YNvgF+3Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ycPyXlQxqPcynh4hgD5HOBjhMwhv2JiLkDDxXjwNZ6g=;
	b=k0qbqy7h17o4Z175WMnbhNsOkl09ERwUcjko3mOT0rXzoMSSGi9ji2MLfuJ4eGBINQm1
	 SMFrIKh7A0cXQPeBAADQwsRcYCNvD/kRgE893FtLBevFcrhxw9IPurOmxz1a3wnr/w2qb
	 y53KDkpmJRk614bxiXTs7Yqao0/gFUSOiejoPQdXlQf81N0q1hiJoXE4fEeDB49Bzhu9N
	 Lk9h9opndy/vOGoh8LnTFb6mDJ5mWRvlz2HNIbVwdHWlDVSRCg/lW6oCKPWf5iBiVYt89
	 Y48xVBckAM0C78i/vn8jDAxiYf4zgZQe/VC4JdEDu3ykj2SRcmJ9Jv6Gpi+qLWg+Hyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kZgNCjDz;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5976072A21
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 14:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD5976072A21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kZgNCjDz
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so33476755e9.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 06:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794493198; x=1795097998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ycPyXlQxqPcynh4hgD5HOBjhMwhv2JiLkDDxXjwNZ6g=;
        b=kZgNCjDzv07bETMIK11cdb/uvBRZbV73giXfxQwMZzyTHK4wPxme+erks4m19S/IhN
         cUmGDySLN9pAi/hNBAG4/zkhGD15KaIcLH83YK69msdqB+KjIz+jo+dqRGEwxCIDN3pS
         wv+lj7+q2dNnDNKSmpIAEPa8JJXdj4rT3H++MAjNm7vHmNAJSolee2JBYg6uje1fgh3/
         gC0rFC1SA9Z/j8jTB7Hng0PNzah8keLDOdxWsDRKSNQKbs/2W57p8dv85B9/1IQYcPTO
         teZI/frS3AXhHwAbjhHeomPDiPCMxzOF/KhFhMSrSPzGC5hRSIM5DtL//P3tp4MCh9fF
         eU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794493198; x=1795097998;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ycPyXlQxqPcynh4hgD5HOBjhMwhv2JiLkDDxXjwNZ6g=;
        b=u7mWLVaL+HI80UCTylOAM50SywtoJEdG6TP/vTaAKOfwb8sxNSMXYZ9JIf1qgOeRkJ
         bYLwM7DAEUoLc/YHL2pX7qo3CPmEmiW49JEhJau4y1PxUBvYLS16tT2HXNw2ZGlQicz5
         XnJy+3i9nGsVrsaTKmppACmoclnPT4mCFSUoi0yauFbmW1v+e4BWjEKrt2n1Kk+FRYA9
         J7m5sTpCM01vz1rF/lo70IvUY265fO/9xVaZRXkRNjOjzQIRm9A0qGJ/PNn2RBOCkxKa
         e2ndZPOkgEuiNb2sh+mRluBM2h0CA0TBeuE7YvuDXTXpd05+y5osUoyOPEV3JmvPXViH
         wWZw==
X-Forwarded-Encrypted: i=1; AL+hErFkZeutwYhXjmQqff7JCdwmU/Z52/FP8Xn2uEFJarCyL/lZV2odJP+8cPvfa9d7KDDFDaZ/o0vZzBQf@vger.kernel.org
X-Gm-Message-State: APuU4Z9WPa6HD4TS3TjrBmOAGlYLIITTD9FZT8Tt5rykmk90yFtGYJ1T
	kCKZ1fOD97tMpy4U2mSrX3gchtjnXjWwm+wIOvobZo1TW4IOE7+QdupXSGK/fP3ezkA=
X-Gm-Gg: AYBFou2kTf09gTxE4GozCmNJFCVH5dkygzCievYvtyE6+XF4SNhmuc7GyIlYj1+BXZT
	bVoGkoxJ2///nANFz8Xs6sqvPAaZU8xDhbiRVHyaJJhtqw8Xs2bygzkfd/+CVErEaIO1ZDS33a4
	S9uA7s+Dqp+cFVGjLZcLsuVxYWzpVgKAZwAcc8C0obnn6foaQxEziyiHGUvSVhNTkJ5pXY5IBs+
	LUsw93z2B43SN8BxwMdLhpEf6moWm5neMxZsR0zpuovI/jOMKbF8mCr20lk6cpkWtYwWzdKaeuz
	9lcTbbTFd4ePOsNe0MLvF9ka5XKkiWnqP0Mwbwe5GsD5R1AEfWdGeHwpJZsezekN7YGVEZsxoOs
	Y0AGWaB5UQjHlYwE+h3Xr6o1tnBMrg5GRCrXp1OSwhn79RUG525FkdiieKI2aQ/VCVGmEYszuWn
	uiIe97Cip7rTordTmSfvTSoKJKkYnQvPcCocl86aecAn7GRvKPWsmlrfz+omS5YJAyPqpG7lY4d
	WkiYe0pS0/cLQR9cbslWFFZm0dUM/44JcJJTWB+tGo20Zl+WtzlAoH0BKf958Z4pqPZxubEV8CR
	2zoIQhd16QjtykfAzXNrjRnoDlMCHGVa01tpdSoAZu4=
X-Received: by 2002:a05:600c:4f84:b0:4a3:59c2:b41e with SMTP id 5b1f17b1804b1-4ba0931ed6bmr104812575e9.4.1794493197930;
        Thu, 12 Nov 2026 06:19:57 -0800 (PST)
Received: from [192.168.0.167] ([109.78.26.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e29d24dsm75906065e9.11.2026.11.12.06.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:19:57 -0800 (PST)
Message-ID: <a35530a0-3a4e-4975-8335-94898aa9abaa@linaro.org>
Date: Thu, 12 Nov 2026 14:19:55 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] iommu/of: Require reg for iommu-addresses
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Vasant Hegde <vasant.hegde@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@kernel.org>,
 Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
 Eric Auger <eric.auger@redhat.com>, Joerg Roedel <jroedel@suse.de>,
 Srinath Mannam <srinath.mannam@broadcom.com>,
 Oza Pawandeep <quic_poza@quicinc.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Alex Williamson <alex@shazbot.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, devicetree@vger.kernel.org,
 kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-4-5c0f72083e52@oss.qualcomm.com>
 <3713bf13-cec6-4b02-a29b-8f76070f03b3@linaro.org>
 <97c4eabf-16b0-4e3f-8aab-1c56912c27d4@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <97c4eabf-16b0-4e3f-8aab-1c56912c27d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/11/2026 14:04, Vikash Garodia wrote:
> 
> On 11/11/2026 5:32 PM, Bryan O'Donoghue wrote:
>> On 06/11/2026 17:14, Vikash Garodia wrote:
>>> @@ -257,6 +252,9 @@ void of_iommu_get_resv_regions(struct device 
>>> *dev, struct list_head *list)
>>>                   }
>>>                   type = iommu_resv_region_get_type(dev, &phys, iova, 
>>> length);
>>> +                if (type != IOMMU_RESV_DIRECT)
>>> +                    continue;
>>> +
>>
>> This change is not about requiring a reg though, which is why it 
>> should be a standalone patch with its own justifications.
>>
> 
> This is about reg, which determines the direct mapping, hence the code 
> is very much applicable to this patch. Please refer this code [1]
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/ 
> tree/drivers/iommu/of_iommu.c#n223
But this change is not about requiring a reg. It's about not reserving 
when reg and IOVA don't match.

So reading a patch entitled "Require reg for iommu-addresses" doesn't 
actually transmit the information of what this second change does.

Which is why that change should have its own patch.

Require reg != don't reserve reg + non-matching IOVA.

A reasonable reviewer might ask "why is a mismatch dropped instead of 
reserved" - which is the question I ask myself as I read and IMO isn't 
answered - which is why I've asked for a patch which reasons that out.

It may be that conjoining iommu-addresses/reg and !reserving mismatch 
are in fact the same thing but I don't think that jumps out of the code 
as you read it and I doubt adding to this commit log would make it much 
clearer because it seems like two changes in one patch.

It would be something like "require a reg and don't reserve on mismatch"

The "and" part is the part I'm flagging as likely deserving its own 
patch which explains what/why but "require reg" ain't it.

---
bod
