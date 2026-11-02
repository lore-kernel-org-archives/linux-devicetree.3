Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605395;
	b=si62Cz0N+xSTzBn2pjnL699vTrHVCMwgWT6V/v7kS4IgMWyyiNS79C+tXP+KxqnZMJjK
	 OK7ZLYkvNGEtdp5+CiTuK6KmSJY8cFZLieY9DKAdrGbRw537uhgCQAjWq+PtJQ+VRevg2
	 eIityfnPDF4R5ustm3fxDXYfsIhfixLbfN8X5kPdQPoEYFBN9R1OjfPait0plLqGcjmHc
	 ys7cv36uJUWd5ey2533CangeOI7/0Rkf0h9hsP2HhncDw6UiEv8OpfIi9zKHG9F6yfGJk
	 b91hKABYDp7S33Lo1krKqRXg5KBEDLuSJ4V9tQE/lEqtXT2H2j7jdiYSOsFsPYyL5hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605395;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=klOv1N84yVFiX5VyeIBQfSwBuik5rDbfaMDuPGgQBP8=;
	b=Xsd0A6qpUFG7wv/S0gqDuFbQSLUr1plMjxfa0mG0HDSyBNoTlB1rp4mhbRLwA0BKz3+t
	 nMZD1pHgZgiYYF+jtXVgyOuE3HVQYJX9gvDnBVymzDGr6KtGU1FeytmjbIIhdcr/7V/p8
	 N4CBvEPThg1SV5eiXb0i0Gf6JGk2IcOoLhqxiZuCzVV1WfBqyCzJA0qHywKGqbJp0GuFd
	 Xx92xPSKUtOtasnCfrb/sJeV+p3V6lBoBrL5ofDBatpUKuUcE5AMupIUTW4SLtJmmVm2R
	 gd16aRb4U4NHi12knWaFZig94zaLUyJf5TbElF6nn2kBgcdfwVAnNhohU60GNhlBqSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Otw4bcgG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RYap2Or3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F92606A32C
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 07:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4F92606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Otw4bcgG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RYap2Or3
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A26pgTO3121054
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 07:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	klOv1N84yVFiX5VyeIBQfSwBuik5rDbfaMDuPGgQBP8=; b=Otw4bcgGn2SZvAAU
	SHiX5S9Rrnm3QRUvZgrsRrqaD1dQiFSlL6Md4O+n4J4OGWK5rdgqDryMx/ELO3o9
	XR2WZjLrBBBBT+XfyZi2JUlFaOkcZFTcMnIirfWcxJ1gx1u7d1dEJCtVS4f2vl0q
	V4JDx9bri+DEGBQ25AaMFinqdsyFdOtaaABhZ56xYF5mpOgBkJM9Z2CgbBpcEBsX
	Oe5llLh5WSVoaj/VW1LSKDHpP/+Q8VOLXwrDkVpMXR8btuMadadyEdw/PwnqDFeQ
	n8KbV2HD7uzE5n6SLGqsl/i50c4wroRDDp3Vgls+M+01/nSjtv46kjeJyHRGqUV5
	mvmKFw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmer5vp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 07:43:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-534f3fe0236so34579681cf.2
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 23:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793605393; x=1794210193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=klOv1N84yVFiX5VyeIBQfSwBuik5rDbfaMDuPGgQBP8=;
        b=RYap2Or3Tukg37XesOeKdFJSljYjcNZwZb37F8HMEYHwXH1f0DsIqPC3M7FqOa6AC5
         IArWCNtX5iqn79suJRj2fA+OENH7A/pcMU8S7W0jqbj//UEmRzvl9klABB0Am4ShHUVn
         kEKVEZuocpcjWAMc9d6I7EXWeRsI6ORw8pcICyc9MobjYSjMa6/OhcMqQnd7SmCGcV7O
         VjVHZrtiuD8M+T9EX7faVKHP/hFASvTHaTv4Txwp/rxZPrQHgR+w7zs2WanZkx5bGdXa
         07x5bOXw9amWZN5Dez8WccKXY8267+8rwyqGN1H0JvnwGVGspyuwXIR7yWB8Jxu3s5LI
         G0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793605393; x=1794210193;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klOv1N84yVFiX5VyeIBQfSwBuik5rDbfaMDuPGgQBP8=;
        b=o0YTG6TyEZCcVVpE/tNSYyPKS0GU1ZiJraPMqqrZZWm3T7c9PCmmO/2H5lztLSZrtq
         q8t9aZTheUwWgMUBmyGjdDNqAboNB9auV1+XVwSeIlqarnB/tudXMN/VCmnTTwySR99f
         o9Ucllc6fYFvQ5guW089xujH6QkV0f4e4+ZVgty+hyOC2L6ipvBh60T3yinH9OMnMFkQ
         7mg7S3g2DPqVJO/plISGX4aNVvkNPU6qvCNRpowVEy3iL9w2hMNnCYWwjNNd4Jwr0B4P
         nSsVgsBj2YGfIXUW0194tGgA486QBPSSvC49KH8hCFBcXAFlzcwIQ+TRqXFLWMo5D155
         gsOQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3cGgJuLltDZdApzV1pkaKQnKT4iizP7j6LohZqj8ZOHq1lFFIERduYz+HuyJD1F7e2wGMm7IK3PQQ@vger.kernel.org
X-Gm-Message-State: AFq9FYJri2RbSU8xCgpZktWiqlCz1hPsqVL89T+tudS2HA0DvUdnYdB3
	aUE27GgNizfaATt+8fkVdIC5QlfzCeU7RheJpbmCS4zyeB0bFswa3T6dYVuyMa4SHRDYk31gHGE
	OlaSZ4lJLguyegakDLUbDgFp/guiotCTxbVSUSohPcrQ6QqsrrLEPo3XXjfXAaCBw
X-Gm-Gg: AYBFou39YK5IRSebEAKeGjGtRTvQ7wN2lADr8YDaHRLlF9cClr8RvqkYcSC1whbB7uH
	c9px8U8/hmirxdtjRvExuArHmkrg8SFj5vk3E7hQUbO8f7GoQs906ze3xgdZX1AoHjp5Q7kJEJ/
	ndaYHPbGwSRKESzlAN6+rJOjiL/nVYloOoZqKUt0OFB4BVS3VxH80uGtsqQ2E4JGGz+nYk8qC75
	KzlTDT36Ayi/vmS3cuzn096QEpjNLo64KpMxi6Tc+f7fEZKSciskTIm4CzYgXzlEvV7hnk554uS
	NoP8EMJrZnwreq5zY0LMFMHljYujSRwnervd7NRibEaSPs+bIzlHM8jepZkJQQIQwb+gyhIV4n8
	6P4IfJi4wXMrIxcr/YKf5nb2SED7yesafyXGT/EvA3oFnK59C8iXBHJ712dKUVntrjvD6k2XSqg
	==
X-Received: by 2002:a05:620a:29d4:b0:93f:3cb0:464b with SMTP id af79cd13be357-944216f1ff6mr1455249385a.49.1793605392625;
        Sun, 01 Nov 2026 23:43:12 -0800 (PST)
X-Received: by 2002:a05:620a:29d4:b0:93f:3cb0:464b with SMTP id af79cd13be357-944216f1ff6mr1455245285a.49.1793605392157;
        Sun, 01 Nov 2026 23:43:12 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723cdsm18976337f8f.12.2026.11.01.23.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 23:43:11 -0800 (PST)
Message-ID: <151dfde0-4057-4ace-88f3-3939612e4dde@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 08:43:08 +0100
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
Subject: Re: [PATCH v7 0/2] Add UFS Host driver support for SpacemiT K3 SoC
To: Trevor Gamblin <tgamblin@baylibre.com>, Yixun Lan <dlan@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman
 <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, "Martin K. Petersen" <mkp@kernel.org>
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Jennifer Berringer <jberring@redhat.com>, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <20261002-08-k3-ufs-support-v7-0-bb39007ff9ae@kernel.org>
 <DMICF1DA617T.1TZ7DMV5WG818@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <DMICF1DA617T.1TZ7DMV5WG818@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae83f11 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=IpJZQVW2AAAA:8 a=T2WrtOQxrTuvjP7BPBsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzMCBTYWx0ZWRfX65KD+7Du6eRZ
 oazgqyHtfydp4mhOil2lDPqMnD4ZTrGsxt+Ma0h1Plbdt83tGiwNqheZS+CUwRU0ZEueU88Xy21
 5lVd/7X67ixRIm1+iPTB7vE7/zA6AoOZCR/6PLnPmqF7WVcPEsbMDF+95HrUHPah6frM9KhP/uY
 zU1RwlN0IlnDqdyXPrpJS0w1B34ih1t63PgZLRymhVTQOKluHV9W1dnXxz6HqIWpJVmDfLF5HZj
 vtRcsHvDidW/w/zm45+o7ijlhJO3xCm0NugstjhEtNdZv/mUVjwCzpnWvxtiSWPDHQ3hvD8nV2s
 zEKoxRmjNmcJZXPqr81Ks+Ll5g44XJDMGfMBuBYIzuPKTfAHgHfrEGOYtE8pM4vjWszfSqPLqUU
 DnoMg6yekGSQncGb+yzFUAWy1zn0o5XNx/eiV3mIlufCL1FvFM6x3bcZ12YynKM+9/GVVaxXRo9
 /UEVyAcqNBhJlwAQ8vA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzMCBTYWx0ZWRfXyAuJAv6ULdfc
 ae7TS+yNV///qDFUVUWx+lPF7BZmrN8yiADUwFk/p6okrAzRUqlInbZS65gtcsnb/SxmN63ioke
 92CkjH+Xmlq3yH8fQznjH6aqjbSp1iY=
X-Proofpoint-ORIG-GUID: dK64Yx88wPR69JORgFGEuCvZnRBVu5nd
X-Proofpoint-GUID: dK64Yx88wPR69JORgFGEuCvZnRBVu5nd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020030

On 30/10/2026 18:19, Trevor Gamblin wrote:
> On Thu Oct 1, 2026 at 11:10 PM EDT, Yixun Lan wrote:
>> This series try to add UFS support for SpacemiT K3 SoC, the controller
>> components consists of System Bus Interface Unit, UFS Host Controller
>> Interface, UFS Transport Protocol Layer, UFS Host Registers, Device
>> Management Entity (DME), Transport Layer, Network Layer, Data Link
>> Layer, PHY Adapter Layer, and M-PHY Interface. A more detail functional
>> block diagram can be found in SpacemiT website, chapter 9.7.3 [1]
>>
>> The DTS patch has been dropped in this series [2], and will send
>> in separate series once this patch accepted. For people who want to
>> test UFS driver, please grab the DT patch from version v5 [3].
> 
> Hi,
> 
> I've been testing this series (and the DT patch from v5) successfully using a
> v7.3 kernel in Yocto's meta-riscv layer. It's been working well with fastboot
> flash in our nightly CI. An example:
> 
> https://forgejo.baylibre.com/tgamblin/boardgarden/actions/runs/827/jobs/9/attempt/1
> 
> For both patches:
> 
> Tested-by: Trevor Gamblin <tgamblin@baylibre.com>

No, you cannot test a binding. Otherwise explain me how did you execute
it on the device?

So if tag does not apply to 50% of patches here, why you can't just add
it to the ONE single patch where it applies?

Best regards,
Krzysztof
