Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492264;
	b=F5ZcCOFiQHGznQfnbKfbWdZ1kvoO3AGeSPhOyR/i17zidathho9u2OCwmstwWXXotUjv
	 QQKOFEGc6DucSKRffqjHuCfdgSc/tfDkgklA4plyr0kwIZwZFlpzQixbrcUWgh9VJvVAm
	 1UyYrckvhBZ80CXuI1Y7rAHe1dxLgq0StxOH2NqVPKUDaUp8rqNaqPTjNnL4BeAj7DDhN
	 5DmfNtWhXd6kDIPFC/p09GMF8KQeeck69Q9b6JD/lRJT2c84n+SWg5fYdI13qYh5D2GCW
	 8lywL5ArF+fCMptAQr9E3n5zCCn4Ay8dGDLNdEKPJwU8vIBHARIWq11x6AG7u/LHk8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492264;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B+CH3/jx2KSH+RRiLFJDBQonfvkStMqSF3XdFCzZT8w=;
	b=TF8YZkRoVrAWEUopM5DlsBzdLxQiVlzX+ILAbofoE3Rnj51MCJTYXE5KYvuw2wdWhE0/
	 b5eoEVNmQrapUYtdFRf0zL/TQJau9LBM7QG8HUf+aS2z2Fx4rwJNsJCtNmXuY3T1dg4W3
	 VV1q/+5500bLL2Yh/iF+IQJm1O9AbbTh4B1TDdrpPJgep27Yt6TbsSiq8Oxk8tkSv6v9q
	 iIgqEqUPwehrTWwVbnH2lq5R7c/a3Zcgl6/SlQdFOOj4Oeb9qkWNxGWfvXU1V9NgefdEA
	 WMr3kzcO0BS0Zam0dZZlO9RaXHBhozJbmLOFB8IDPP7Ha67QQCy+yL/MaDAeNieq1/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Pt8mT/O3";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zkdyv7FZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F507606AE84
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 14:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F507606AE84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pt8mT/O3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zkdyv7FZ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9Dxis480117
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 14:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B+CH3/jx2KSH+RRiLFJDBQonfvkStMqSF3XdFCzZT8w=; b=Pt8mT/O3E+MdfLZ5
	irvIgS8uLB5HnZNSkjqw9uCkzssqONuDPOuy5kilOtAmiJYPSUIGSxF9D13buTDW
	+aiq1LxgbwgdvUSAxVbw1ePXNqBwO48/h8xDkJyoNw2v5Sye+5IkGZ5mYZBhXSek
	9IbJYB9tIVir/trXeHtT9QBeG7HdB6KhiLrlaeALCLDPAhar3kGWHDWv5bKoDo3y
	b1Dsb+rh2gEqjZQn5RcwKEHhw1XJjnEJ/9RV0rfBb56LC0GBgri8dlL94paAxjrr
	w1g25DSeUfIxH8cy9wY4Y9eKbEvUgEKPcm3YmIbx4AGfryQISQPQZM7vH49th1Rc
	Ed87YA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwan4ry8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 14:04:22 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b25d977b91so5145174c88.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 06:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794492262; x=1795097062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B+CH3/jx2KSH+RRiLFJDBQonfvkStMqSF3XdFCzZT8w=;
        b=Zkdyv7FZMAup7d7VcnxaVAem3tfHj5MSFqZtrqcidXWFs7hcaVhX1gf27oHzB2TEEB
         kvMkGB0vbGlN6Cd4G1y3J3mO1SN+/1C6MGibdA/X4cUpEUXNV7uVokZvfuX6QJ+Poyam
         zFs1Kc81Xes1FcQ9nO/+M2sg6VuLXuIdD/nHbbswzwV0de4ZZH0TVrlDt6tKfU1GtRI1
         qhvF4mjdOIDWI3rrbHgEk3cUzd6nn/pxW02mCQ6GM8vh8zJThB4l4CWFEqOPXWgftQiw
         iua5SuEaZsKOZPSst79yXKuZHWDTzmjEXt3+cVkHS4UhCuYfJcf9jA1Q7mA3tr0SxscB
         Me3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492262; x=1795097062;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B+CH3/jx2KSH+RRiLFJDBQonfvkStMqSF3XdFCzZT8w=;
        b=GB/RGi7Kc8AbB2RiXZUfWK9y7qhoAJDPIWeiE6Ct9OpUtPkIapAXgG9VdIAKgFG/zV
         We5TMrjI5foHWZ9sXeZcOn+8vojTwIjKmjv44PfUhUlMg4wMmPoOkxQNuqPzbUaw0kGy
         HvdbTlcN9WM+7pZyu5TtIQ32sqDk7mrBKKeu229bY8hU6BqZhiO6vSP4t5V4g67ko8d6
         LV6OFIydY23jN8NO/+yy5/D3ZpNScDRqwXIpFeIsXsKrRZUP34hvLxofb9hQ+RqiBsAP
         IK3Vbtlk6qQahex48JlAJy3MLK5nORMXJlIxtfT8BKITo5WinMFzmXaVDV0ifb0JRZnq
         eddg==
X-Forwarded-Encrypted: i=1; AL+hErEd9NZ68HecVnqKk6gSdPrB6J1Ptfjx0O7HWdrUdOtjjvOIfzyihYydSB/6aqctwQV5Z54IsL7N6oMe@vger.kernel.org
X-Gm-Message-State: APuU4Z957plLHoQkvBzJ733OgECh9j7k+49TpWF0Flues11pG490368N
	o95I2ekES2L0EI5DbWV3HGN4dPRVlOwp2og9rRO+vyy4obRmxWGO2owgnm1cQ6altPdauktF5kn
	V7kPvRNXOIiRj88iXrRKGKCvIrLk4IV4xws+X29kcFMKmRZoGGk0siiB/52ht8WCT
X-Gm-Gg: AYBFou2OVwGqYQa1AGbP4R8pZZUVyX/6mrSkA1Bb5lJPkDekYdrjt/s2SdG0aqqj+nC
	k3K4RVehBVtq+LxpAHUr/HRrQ5R3vicBdbxemhXyqIy9bWNumJy8zbxNOexwKx2LV13RXiPdurh
	pqSAawgjugw8/4yjMN3pqPsdnXMQyc34ocGTC8tDQi22vLUpeV6qLkGbiL5UGu0P/NCQ7UPETK0
	jitT86fA5k0r7ODKnEv70/sXLBxY21MbsnwWzdMzyxHx45QAL2pXPvCkL9gd1IhMD84x6p1FC7w
	rX8PkNNkNMeY2nZukvtD93g3t5hU0SRtkqwzuoTSaY2dYWGRmF2xAhpZP0BH2pc/5nDENoBSADm
	qK9t3Om66KJSNqV0XKyCsxk17LzD+W2aqZziWqdWFSauF9vopydJYlPAnAxmWBDF3RQvX2iqVbj
	fPU5KW
X-Received: by 2002:a05:7022:28c:b0:1b3:bae1:f5f3 with SMTP id a92af1059eb24-1b3c023c99dmr4854431c88.6.1794492261680;
        Thu, 12 Nov 2026 06:04:21 -0800 (PST)
X-Received: by 2002:a05:7022:28c:b0:1b3:bae1:f5f3 with SMTP id a92af1059eb24-1b3c023c99dmr4854412c88.6.1794492260879;
        Thu, 12 Nov 2026 06:04:20 -0800 (PST)
Received: from [10.206.104.93] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5029ecb1bsm14027c88.1.2026.11.12.06.04.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:04:20 -0800 (PST)
Message-ID: <97c4eabf-16b0-4e3f-8aab-1c56912c27d4@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 19:34:11 +0530
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
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>, Joerg Roedel <jroedel@suse.de>,
        Srinath Mannam <srinath.mannam@broadcom.com>,
        Oza Pawandeep <quic_poza@quicinc.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Williamson <alex@shazbot.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        virtualization@lists.linux.dev, devicetree@vger.kernel.org,
        kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-4-5c0f72083e52@oss.qualcomm.com>
 <3713bf13-cec6-4b02-a29b-8f76070f03b3@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <3713bf13-cec6-4b02-a29b-8f76070f03b3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pzmLPAWcs5FthZfO4JKDhjrORA8Lrg-B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NSBTYWx0ZWRfX0ctZU1gju2rI
 Q2Hn+l94/Y0wtfODuE/hIAnKqLhZI0nEvwvU8SZNtZ1ONEaXOberZBB6aj7nJcqUpRhKLEN46vM
 mzgNdJZE4EhokCgKiiPFNt90zFyc3O8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NSBTYWx0ZWRfX3tXZjKO4hxpB
 /POmOo+ITyN+H+elqJZ0Ac4ZPCSJjtg0FElzKzKq6kGeOUog5uffKZRGTRRLMStsuRjLWgXGalm
 1DPPuOPcxusvxtdcEExsg9MiukS16X5CpJs+7SFt1t1tw+wVdGPiqe/p+/Ap5sLQOkz2U6B4rZ6
 iUVOTLqJB6D7v7jBX73Sc/JM7x4+MlbZYGy+Vtlss+n4iCvWCoYB8NIeq9N377fOxr/y1u31KeM
 kUPVBgCAcoqyNcDG8lMCO6p3fRGfvs79RZIAUAXZhCcKe1A5dpgJszR/y0WGOa/3PRF3nhMRAz9
 wpUyBeYULZU3VUC0URxuHEdmkfitM85+qQafwP/m5RnNKH0DkfCK/topEtjXQX6dHuLKegpqfTJ
 GEbRCLAuSDSzK53F4pLGmCVinDCjtDDCbrQMW/1nF+Nq9ML1g9S57TZGMG9YId0M9GoV9e2Anxo
 243cpAjx7oGQKwRl7oQ==
X-Proofpoint-ORIG-GUID: pzmLPAWcs5FthZfO4JKDhjrORA8Lrg-B
X-Authority-Analysis: v=2.4 cv=Gd+CDgXL c=1 sm=1 tr=0 ts=6af5c766 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=DrYjplHx1sOd6opfFz8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120055


On 11/11/2026 5:32 PM, Bryan O'Donoghue wrote:
> On 06/11/2026 17:14, Vikash Garodia wrote:
>> @@ -257,6 +252,9 @@ void of_iommu_get_resv_regions(struct device *dev, 
>> struct list_head *list)
>>                   }
>>                   type = iommu_resv_region_get_type(dev, &phys, iova, 
>> length);
>> +                if (type != IOMMU_RESV_DIRECT)
>> +                    continue;
>> +
> 
> This change is not about requiring a reg though, which is why it should 
> be a standalone patch with its own justifications.
> 

This is about reg, which determines the direct mapping, hence the code 
is very much applicable to this patch. Please refer this code [1]

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/iommu/of_iommu.c#n223

Regards,
Vikash

> Basically the patch should state why a mismatch is dropped instead of 
> being reserved.
> 
> ---
> bod

