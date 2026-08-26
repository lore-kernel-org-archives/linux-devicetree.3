Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F18435B657
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738441; cv=none; b=QWRBvNaZVxOw6GORo8phLSBNtdto0kSTIzycpZBEqTfI4CS1ojgoQlviMDXhyISxer8qA/25/Ovs7M8CRJo8jn+HZ5jo86XKLxH2TCsIQD1gkx1y/pHW2PpTkp/HdgJ7MFrgruhKM+133Nfhyv1y62Mg5SyV05TFvEpZjzG8sWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738441; c=relaxed/simple;
	bh=2tIay9utLpnlcwtUgSKhbgoQuNFe+ipOGrnK5lR27AA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lGyhzzicdlRqjpsVEUbIjYvAHpzTu1vt7xwpHRHQz0DFRKJQ8HnrgdQ5kYLdRTsqcAhF6HSSx1VkM1DCBFBg6mmexdZ2cTM7T9XLvSc8EVjIqRg56x00/2Lvh9+E90sCzJ7ZzlE5I23MZEMe9aLpJJqv9Rj086sTpU0qwM3LcHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=efRCbKGR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bYb/whU5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="efRCbKGR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bYb/whU5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q9CeAV500891
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2tIay9utLpnlcwtUgSKhbgoQuNFe+ipOGrnK5lR27AA=; b=efRCbKGRAGKH736B
	0xt6t+7AVMFogL1nq7xV9gW/MdN24i1hlHokj0OzCf59Djjsah11YL7G9vsKHPtq
	WBP81czebBWDhqfBr3AJhO0LNUTFvs56pxpr1BG/jt5U+xPWoXxJAPxAkoyFiq4R
	MEJ8roPSkzSuI18v/1rDxDOUpovU8fb000KX7nagLimQmSm8C/HbkEDdBIMYnjp9
	+UVkYQB4NbQW+juu5p6mSlQ27fGIoF/9jcS+bTl8Xr0rEAAq38Dpyh3+iVxtYy1Q
	ajsvegJxJLwA/1sB1ivdKnMNywFSXDliwpW/Hp7uPtdZE0/SXeiwygUHPxAonCYQ
	dAPLFA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9g4mu3b6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:00:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52ee59064d2so1011691cf.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 03:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787738438; x=1788343238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2tIay9utLpnlcwtUgSKhbgoQuNFe+ipOGrnK5lR27AA=;
        b=bYb/whU5glzo/wEPxBWAvq2YM+s5ZSuaIijRLHtD0UbMTsmrdGmJfMRWk+yvrf3m+6
         gIx4UODOAai7ILysvPP7kOpsPk7ZsaNpkV4Ma02g/k8El0eCtkvRYcM1Oxm5msP+3F06
         jNjxU4FyVkTF30sDPUmZCSDnhn38MwJv3zxEN25Hsg682HxkzNsPrQSVtq/RzX4yunrk
         9lcCcdUUvsCOVIwSiVeIgjZWLZriMqkaTugAj1g+3ukrBwIMfZgk8066poqlKHem3HLo
         h0hGPIxVLlFY04oLbYyY9HwzKMlYXgXs0mMZCBt/qIF2vrqWKaejelIz7sKWhKR3aixh
         eeAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787738438; x=1788343238;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2tIay9utLpnlcwtUgSKhbgoQuNFe+ipOGrnK5lR27AA=;
        b=PBEIerri0ps68ypOV9ag1dbQhTbpG4YbW8KtG7gG5IdKeGEFy6UXQdTAPE0LkKh5Rf
         44xtd1GlrDUfjPzzPfzr0ml2/aVLVXM/X0S/BPVrCs5nV2RG/suWhj3URa6yWO1nX58W
         kV0gyC4UzN02Bgvyn/roakEz/51T8vTkcLRDvqcS+niE3G2WcbSPuvCKoheeVHRCGvns
         C5VZ7n6IGSDolXlSI/GLQ27DT60z/RdwV/RSETq6Fv1g+INspVUhQHL9dQOrZ7TWnHB0
         XVR4G7zQItL6jCin43mv1K7MTIHr/kYI1eQjEfJS5nUSZ8VIOXhdPBKn4ZjuuVU68zuO
         Tf6A==
X-Forwarded-Encrypted: i=1; AHgh+Rph7ClACfNtIgTPasOPYcxN1AohDsZKnzbqid45SGIp3JtvNKVkukhPjj1vKgdb1YSg+BPTy7RAJp/a@vger.kernel.org
X-Gm-Message-State: AFuF++nH/AolWwI8M3ANAAdImTV7adyPgTmEF5f76QRezTMVUrCs2iF+
	/3NCCHhTP7koovpnSQ9zJKTMTfRlvZMRqeiFYfeJmtofxvWTSIDYOmAPcNkx6rBTGZkLGpJyAkQ
	BEBDoDjT7FLhNsFzinmNrx/UAaJoV80z4AE65wMpihP1w5easslCtDC2xvNhEaPFu
X-Gm-Gg: AR+sD11OS6sa91Ck8DMv5QDTVghWl84cpYkoxcx/Ty6SZtMf1bBTV3Zw+92XZDvKffI
	7T/SRtiDWKmjaQ1xJG7KElZgri3w8z/S/DwGdb5A26wUtEADgNWRLFQjjd412pOYhUFM4O/Q3yp
	JLCoA1l188id8ReFK7Lfftzu2D7T0k7XdLOzvDGLz0LQx7ZQdnq8kQIj95TGXvQhLGf30T/aGxs
	tT2pOEzqhFW6NnXdNqU40L468Dn+1A0fFVZqT18QKtb01oBjIPJCenL7PRVb2X8yifBJe4iDSUR
	8Eb1swJolfm3wgZOmpQbiYoIqoTY4MkrS6gRpPksrbblqQNDZ+0lIWJeNj0e/qrYY3XjKRyXbK/
	13MNXgH3WJ0O8Ivmms+Cur1nrg/7r
X-Received: by 2002:a05:622a:490:b0:517:63df:91a5 with SMTP id d75a77b69052e-52e2ed34ebcmr132644321cf.19.1787738438133;
        Wed, 26 Aug 2026 03:00:38 -0700 (PDT)
X-Received: by 2002:a05:622a:490:b0:517:63df:91a5 with SMTP id d75a77b69052e-52e2ed34ebcmr132635921cf.19.1787738433413;
        Wed, 26 Aug 2026 03:00:33 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab1f3sm2254758f8f.11.2026.08.26.03.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 03:00:32 -0700 (PDT)
Message-ID: <11b5ad91-84a9-4506-ae1b-73a64b49d08c@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 12:00:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] dtc: dt-check-style: Fix alignment of values in
 continued property lines
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260826-n-dts-style-checker-continued-v4-0-022e60091965@oss.qualcomm.com>
 <20260826-n-dts-style-checker-continued-v4-3-022e60091965@oss.qualcomm.com>
 <20260826071345.A3C2E1F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260826071345.A3C2E1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4MiBTYWx0ZWRfX2z02sZKpcBP3
 cwq1qPxMbh1qIufsEokF2DPFkF3pSMuAp7ibQ8luUY372ledB1wDIhLtvnaXMcLGmEkEHKZgq62
 P1LmQRV5fG3dQq9t+JYSnpdcoBEbgY4=
X-Proofpoint-ORIG-GUID: 8_5D53lxriauxx_iYg_zqte5k7MBvAoK
X-Authority-Analysis: v=2.4 cv=eYgNubEH c=1 sm=1 tr=0 ts=6a8eb947 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=PCuQmCvmEBbr5SZVerEA:9 a=QEXdDO2ut3YA:10 a=arBHhYMabMMA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4MiBTYWx0ZWRfX1GhpCq+gvSig
 yocedW/5Qx+hiPfIbY/SRMugGLrWylFnPeTG8PxiJVnCdy63mJK/ALMCLTbuM8qTFY702zSLcny
 uKzLI6nQBfnywKyWCLNkyBKP0x4zfQBGNY4RE0+iZe0AsrMXdh0DAhsnhQNx0b24XH4zEnEKSiD
 S6uvrD4Cyd7uAgOr9I0/Kl/M8M3ZRRAMOF11+u5MptCmyt3NZV6C/dR6bSj9IjB5OrimOa4qcbe
 jcK/WweYKRXDmiIq78MI5eZcPjO68idol/XL7e2jCyGsVZBiK7/iuLVmHb5vv6RRpsKot+UGPNT
 ic+FRC+wxQiUxSSNtonPgJAEGAex8ICrfkQngEia71H4H4OI6Tuv7s0yOoKi/Znme1l47OGxJkA
 gA7Ac8jwcmcdVZpaotXykQZNgJhChqOJzDBPjpGiDlmdHTIe2w1iCGv6dOIAne6yObFvEYz86xA
 ALUqJ1B+wJhvP+okLCw==
X-Proofpoint-GUID: 8_5D53lxriauxx_iYg_zqte5k7MBvAoK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260082

On 26/08/2026 09:13, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Trailing whitespace or comments break multi-line property alignment validation.

Ack

Best regards,
Krzysztof
