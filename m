Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328493AFCFE
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 21:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780955981; cv=none; b=J1hkTwpxETK4pEjNeBcO156ZxlYuH+R4KdDkhjBUqo/1UApujAru+/NgEGO5jrdC0eV8RoiWQTOmrDXOGbOWfcnRtCJk6LRXMVkEwsiAFWbJm4zBj0gsNQXgr5PknjHlGTQGxiePMGlrsEblJoGqTs2gdsHH0Z1WGNwDdvocAEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780955981; c=relaxed/simple;
	bh=ax4ze0UA6/4H72uOViA5/ZcefxNmngv7b357bgwEp84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tgeg8NGTwQH/OLXyJTD2vfqhTHCSbQynQO8mgTYWPce/wxMgGhM759Hg1+lH1LUGB3f2vLgRM29cl85EHbTOMcuACo6bbFEb+ihGL7zYu/XSRuZyma38LVzXCsAI++Gn9g2bGobDRtrsdT8YuHYVY4DQ74/yr3zXwstKLLVY1h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kNRWWdpj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PfA2t9Ry; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kNRWWdpj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PfA2t9Ry"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658Ix5kJ236906
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 21:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UKPBCuEZf7xYMnI1PmVPSJnd
	4ME8IsBzg3bGxfYN/iM=; b=kNRWWdpjEdfvTcgCQCouac0FPlvw3COQeV4zwpCL
	VAyiaMo2oAuQDFynGHR5C7y/GXmgikqrpiJ/Xv8OP5GN+6aSAnM+diY3MX9NoGyn
	k9J05kvnPF3zwN85YmKVEMcU5XpMJnhcmPXKkPHJ7ufl/hBAHM+AGAWu1HutgDRp
	rc6ptGuptQ586JQowSIWrTeFGoAchx/36Q/V33bm6NhMxAyvCdmu3PQCwvKgFGX6
	UdE8izwk5NcZlUIfUunH5pH6QBFhzrkVvCglpZpyajuVix+fiOc9EQ4LS9Uoq0++
	vQfS+BEAm3oKcQW8Vvl/2P/egzKqZsBF09ljeOXpRUz7Aw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enx2rtenk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 21:59:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf08c2a24bso45400625ad.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 14:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780955978; x=1781560778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UKPBCuEZf7xYMnI1PmVPSJnd4ME8IsBzg3bGxfYN/iM=;
        b=PfA2t9RyRY5VGzosJMwalPBs4sXhkS1/Mtimk1WEgFpOMU8iumsrg2xlU0C6w9Mmge
         locKe2HjgKrMH5fU31uKo+GpZ4QY0sNdqeHDn6V1RyQ8TtzxE6IxGCrMctBWTUAYffaW
         N1OKv+ixnLmXUKhzke9SPrnp5sldCryFBf/S9hqxxI5dpqHY6w+ybdkMYyhsOLziSm7t
         dCIeTT6HhWHc2jLyxdcvczcZgyLt4dWfUy2VADRBnFxmlyzMf55cdcQIyfiEPPvYoOKh
         7adbhUDKMDMl+Jcxv/7qFba98vycEWWUTGWW6gDKM7MgxoaYtH3+Bg1znASDDjNytqte
         IRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780955978; x=1781560778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKPBCuEZf7xYMnI1PmVPSJnd4ME8IsBzg3bGxfYN/iM=;
        b=LBRfoj3r27fyk9HIQkq0Hh4iRLnRPiBrroMnOHut1iqojm0rh8pAaeC4ouy+bLLKHT
         l4qKCr0J6vMhJHmfpQKAlIOotTkAWACC6Hy8eb55xICjIcbKRXHhw77NbSampPCQd5Xw
         n+JKoh/l+atWr14VJbAocjubzrXHv8KqVVhl5ZVt0ffri7v4v/Oixxz/57bINo09xecm
         8zvlhAMo0/LNFtuzTDswhW2yzbEpmNOLO5rc4mRmYBUOK5GIeJ2AWlX9OXuXN9HjySdl
         s9uTFcM5gT+siolVvunSlcV41HDpUtEmAksLfN9sY09Uu83g/Wku2/nGGlA1zlZ86lhr
         pbUg==
X-Forwarded-Encrypted: i=1; AFNElJ96uEfJU5PAyklFTFVfhM24Pl6cw+3BWKeICb/x6MUS19qFSePb1D1fimwXDLp7wt7yxp2Vfy+xfLKd@vger.kernel.org
X-Gm-Message-State: AOJu0YxeqTLI+w3NhsIefYGBdJT9O21dD8JvfHMgANHJd2WSK5y6q/vk
	cwtEhghQXQoNjmo2mPHDWuS9VRmpgi1TZwZ5FUCLzWdARSMF55r1C4GOl53vrmo5PV6EwzrILog
	uNOxCysAQ1zFSegNDYMahfsHv2JQTua9yATMnni1YVWqkZl1NPP+sT6l4DfQvx76s
X-Gm-Gg: Acq92OFtoJEvZSbWaFyfnvhDYGW52z8b1OrQ5r+zZ0zQNp+AG39ON1wbE+Segjv499e
	dOWwxgy9cnEw5NHcu62+2ItyenOOSP0p7ayKMx5dOq7NE8hqW7mKVALr583I9l5mTAeV5G9U2NB
	Qlr8+BRr7TvbPSIoUmtucXFVxkgVNBbFwgWZI+dj7hIVV/3zXcXy2x7Awbo7gPphoTYcP6PQrnX
	WJeQw5canML9uHwa/yMXZFW3oMxcWY5cHsUudXuLbSV3uxrZd/M1DXBZMOOkzbyfPRox9GHMxFY
	0TmIStmydJHkAZYZcaWwKPXsgh0FHFN9LDYdfCuy1ljjJJl6flcpU2vHc11wOGB0uULlELvijvQ
	dyAImzUyiMTZMhWnI9JZAot/xgWq9kjNYnDgzPJTL/Q3aVxCU07FQdW2KMyEQiw7CyUNQEA==
X-Received: by 2002:a17:903:22d2:b0:2bd:8395:fedd with SMTP id d9443c01a7336-2c2a1cb92f6mr10445ad.37.1780955978145;
        Mon, 08 Jun 2026 14:59:38 -0700 (PDT)
X-Received: by 2002:a17:903:22d2:b0:2bd:8395:fedd with SMTP id d9443c01a7336-2c2a1cb92f6mr10245ad.37.1780955977683;
        Mon, 08 Jun 2026 14:59:37 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f9ed6csm194052205ad.31.2026.06.08.14.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 14:59:37 -0700 (PDT)
Date: Tue, 9 Jun 2026 03:29:31 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: lemans: Add OPP-table for ICE UFS
 device node
Message-ID: <aic7Q2utTYrqXr5a@hu-arakshit-hyd.qualcomm.com>
References: <20260530-add-opp-table-for-lemans-ice-ufs-v2-1-2b46d3ac37d5@oss.qualcomm.com>
 <b56341c8-eb31-44a0-9385-778b5d24ff36@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b56341c8-eb31-44a0-9385-778b5d24ff36@oss.qualcomm.com>
X-Proofpoint-GUID: dbaD80A_yMIcC0hF7GXR4fv1ax0WqeW8
X-Proofpoint-ORIG-GUID: dbaD80A_yMIcC0hF7GXR4fv1ax0WqeW8
X-Authority-Analysis: v=2.4 cv=JdqMa0KV c=1 sm=1 tr=0 ts=6a273b4b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i-L58Xp8eqOkf6jkiZYA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDIwMSBTYWx0ZWRfX1EQIh+UlnYmk
 3wBM6PMP13KnVC3m2VkPJ3CxYpdD39qc286FYkKkTwH3GTP34acFQ++Kocjad40wOBj6eLJ0lzs
 2OumepS2QVToqwLY0hKBPdJW6tHcpxx7kCPxUKwgSfNeWrIMZCF0sj5DltDy1YHW2qWqNJZLGU3
 ZtFXow5BrBJz2ggowVUakXqSjEB0KBbEEKQjTYrDGGs4U+FfKtXangSgTAzZEH4VQo16X4ffgX/
 iYXOMGwtal2Orwzd2v9YCU1GB/EMrA6OKMuu1QeGUlb791e2noa1Jzd+JUiT5+QAyRMXqnh8x2D
 hVd3og8sc8TJng2viij8VCDJyZKo2l5yHkxJ+ACh24D18tD8vWa7zY2Uske4tXfoOVskFC16IdK
 uxiyWLmyX2ELozaGJSQBBxwGw8Jm+hqVqslg5Y3Cq1sIRV3Vt5JejmvpT913hW8OmCDgIJsqXgU
 vMM4zmDMV+BRHj3RogA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080201

On Sun, Jun 07, 2026 at 02:15:38AM +0530, Kuldeep Singh wrote:
> On 30-05-2026 01:57, Abhinaba Rakshit wrote:
> > Qualcomm Inline Crypto Engine (ICE) platform driver now supports
> > an optional OPP-table.
> > 
> > Add OPP-table for ICE UFS device nodes for LeMans platform.
> > 
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> 
> This patch still needs patch-series[1] as prerequisite and cannot work
> standalone. Can you send this patch in same original series just like
> other DTs are updated?
> 
> [1]
> https://lore.kernel.org/linux-arm-msm/20260603-enable-ice-clock-scaling-v10-0-b0b728435356@oss.qualcomm.com/

Included this change with ICE clock scaling and posted new patchseries:
https://lore.kernel.org/all/20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com/

Abhinaba Rakshit
