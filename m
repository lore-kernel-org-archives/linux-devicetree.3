Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC548476CC1
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 19:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786477307; cv=none; b=rkPtzJlxRg2WI9oEqg0jj7Ej8wmvKphG7+i/nq1JdNYkowXg55CYCs3OOlsfNzrzOhupJqdmrmh2ejHgzkuwpakpGoaj3RFUFLbL3zt0VCEjIrq1Pj4W0AKnyF06PypYnCjtbI5AeAL1M+Lo2wQfJhUkYZ2MdtLAT4i3Zv4Z510=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786477307; c=relaxed/simple;
	bh=iPP8GNotfCvFWiXkk1XygMADwrzkYlQMTKBgZTu1uVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MLlus11PRE1H6VRqQyqcxV/61jfB1B0svouGou2I11c1LM6bo2rhYa/9xJCQpidP/j39rftdomXlUN4sv6Zx/kQ9oEAheC/tGrMrVi7MBObrxuq0rtjcqNuBXAud1JFdfr2RPixnKoqJTSYriDhZsi9rjZlKjeoOVu1OhGYeUmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cY4Czr+h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VwwNlIpf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cY4Czr+h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VwwNlIpf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BJH2Fg2105677
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 19:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wkK4tJYYSj6QU0e1X/gFABkW
	3/7FsgEMEDSeVBG3MsM=; b=cY4Czr+hi2O0G4SjcueK8hgEE00fh0WBQ0hjYPIX
	/hEfwarLW7svW2T1ywYRqn1kKhGVv+kndZ65lRTqv1KDD130CyxbO5RQhhZadLpY
	ClxQQDODjvQhwlDPK4t4ocD6Ho/89iJUH7DqC9fMJyn4pjbsE3GjWrneFkZ5RuDa
	Ke6x8L9oz1CHTtULi7H6TDp/xKKf2z4un7MTqEksL6QqZvsbvlwSkfY/JWFoshji
	6epBYuL9U+S+FeXk9isO/kAfw6cJaQmBEdlggKPvRCBLO1lGeT+pFbAvr+NMdb5Y
	CpRbpt2DSYah8ADmhsYQFARH4vlchsY61Tb5VdLpj/Rsfw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g08j5gej4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 19:41:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-904ee4473a8so2031026d6.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 12:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786477300; x=1787082100; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wkK4tJYYSj6QU0e1X/gFABkW3/7FsgEMEDSeVBG3MsM=;
        b=VwwNlIpfAgmDGz+t9Hlnf/pezx51bScc0DMs2Z+IUWGpnZz9SPxjC5E2zrijnPjnuS
         nGYIhOArqfLPAWMCfHE6jdjxGWF9P6wwnKPSAX77yBR98NLkfFi8IRiKJkDrUK/jafbl
         f9LVOSd3b2DoxQN46DUDsF3RhOums3zf1hcT2znpMmse5EgdcfuZSMWdlPazJilz3YC/
         weO7kgGgCOd05a3wjLHDI3GVrXXOXdmHeN+wsfllSGl1g+ojJfTx6Yje/cwmx8j27ENS
         kTy0dUtol39f2NThFPhuFAVP0fwC85BFW+H91sKiE8oAYPDhgqWKpvv9jO5aZR8YEv3z
         r+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786477300; x=1787082100;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wkK4tJYYSj6QU0e1X/gFABkW3/7FsgEMEDSeVBG3MsM=;
        b=H2GamE6Y7NieVraJVacGX9Sk3XOpyYdBIZ3Rpv3bEiGr6Rj06apk3jEjuk9KKy0zHt
         TECkMaLmEdeUUTPzQsYKM4KET5BzJqvu12GjJ2biBKA/GSLFcA2yl2J8U96iOxiDKU+h
         L8RUqtk1gI3C5GKuFD87xwECPUKbVKASMbvpcCh3Jqqcs9/7QAUbyWYuh9i/G0xJ0mR5
         om7iuxA9SPN77amH0ebCmlWXASK5h6AN+zGjjPo5s0qN7qW6RZwpP+6vyRmneCVUBUtt
         B85/OSDGMp8qe6sVPu78Py4XcCgpSKCQeJ4K64mlN+KVWOdmj8F+1SU3HZtHxHhqKah4
         JRPA==
X-Forwarded-Encrypted: i=1; AHgh+RpCD9Ru1bfl2XqYRv4I+BMNSs3040kon0LlwxNwU7EKt5djmG/oq7x1I+XLPj9Ja6/737LVfRmbVj7W@vger.kernel.org
X-Gm-Message-State: AOJu0YzG3nvrJU8eWjKs3vzTVFEO9I1oLJiIOeeTQJeqXzsiviUXKzcA
	g4jHt7R77Bbtr6wV6a+hcMmVDGCc0W88YudIh1R5+fJUoP4nbDwMSNKKKHhCks2FJUCqOLiD7nf
	JLn/LVIr67qOZl5qa1+w6d27n0joI5ySU3ldv1jesXWCqnA3wNe7izaaykD5P+RDDDeMmOXWv
X-Gm-Gg: AR+sD12/JOnTzpKsWqeZVabhCgMhI+98DN/ap+nqQe2q4x4L2OwSOwfpUu7UnFu5FrZ
	WFHeA2FgvGJggzs0XVYj8CMX1r2wIkwEoLvdmJnxND+yefiKklpkWa8Uqv+h4+UhdA7xIqiNZcS
	r2d7m4iWdoUCq1OLrFV5WlzPxDsHQ4h6MkkJd2Exc7eHcxk3oBtcRrgfjP91l8Q0G2LUHgQoGyq
	mfwY7I6tAFaYpvZBLBX8zpEJzDCHlgOeLprjoGm6skd1BMeDdsvIcy8Bfp3uy1qi61UXAj65ZtP
	MOftyOgGtDAHa4+8Hu6gpzH0HtGsbJRDyQBYdsdmlK28zzbdSrLgUECsRNsZD0ilmeX9c/6kcHs
	VqTsst+Cy9KE=
X-Received: by 2002:a05:622a:c9:b0:51c:20:aea7 with SMTP id d75a77b69052e-52d600af02bmr27896311cf.9.1786477299845;
        Tue, 11 Aug 2026 12:41:39 -0700 (PDT)
X-Received: by 2002:a05:622a:c9:b0:51c:20:aea7 with SMTP id d75a77b69052e-52d600af02bmr27895711cf.9.1786477299290;
        Tue, 11 Aug 2026 12:41:39 -0700 (PDT)
Received: from oss.qualcomm.com ([82.77.85.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d5cd2esm727592f8f.26.2026.08.11.12.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 12:41:37 -0700 (PDT)
Date: Tue, 11 Aug 2026 22:41:36 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix missing SMMU stream IDs
 for ADSP
Message-ID: <4czzc3etf4f6sfc57s63qu7w6behkpdbdfrckbpycjulbisibp@ved4wbbsbnh4>
References: <20260811-adsp-smmu-fix-v1-1-a596d284c455@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811-adsp-smmu-fix-v1-1-a596d284c455@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE2NSBTYWx0ZWRfXxxDqrtaRJVkV
 ST3Wh6Uy+P6rg/7nC6WGgzlw7x/04upg1U5s9lQSHjSWI2Bf3Fqh2LqbFEoaS4Ck6MyrKJtLoLJ
 0d2VusgqXnMgRHjh6ye2IVwq4Xj/F8M=
X-Authority-Analysis: v=2.4 cv=evHvCIpX c=1 sm=1 tr=0 ts=6a7b7af9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=GMu+mMXmPKlJm/I3Pt7gOg==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Jh7XC-2lXPCOKyvfmuYA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: k00UhnedLPNhOiG6dw-Sv6p4fgnP0pUd
X-Proofpoint-ORIG-GUID: k00UhnedLPNhOiG6dw-Sv6p4fgnP0pUd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE2NSBTYWx0ZWRfX7pQ8cCLBfeIu
 WW+gHcQWiIUaytOUBJn9X8lNwY9HQZ2AEML1Ke3wbwmIo8XJZLNZzRDrMC0qG6TiDNYV3V+f6md
 GMl+KAWKmme8U6ehCinZFoQ6m2eduvM2CE/9dvRCSDtbl3nHm/B0/Hm/6LJ94LaONo1Y7iy5wii
 4/6udtmjzcmspflNEF33TZznQG3A6en16KFhZ40EiFYdytX603+7QV/zPv3Fokdm31HFr/EVgX7
 SJuZ2jFWCUwF1hxNRw7iovhYNoFoKvU2PB4NeCXY9Z+xkLWCXu2DxaRQfPIOF/rIhA77BjFyog9
 //8qS2f1WfZhP5p/jO9I/Pbed2Yuugme8T2+YjOYb8RgiG89qmVj/0Nqh5Tj6rYWaIvCj3LiSWc
 KmfvnBzdiadWSUwMsvyTinkV20CAqDxS6P0j3fvy74gw1ld/Npv5t1I/frVWXf+VZdv60V1FP8p
 4PEuS1h2J1hvqF6yejQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110165

On 26-08-11 22:14:59, Iranna Mundaganur wrote:
> From: Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
> 
> Add the missing SIDs for the LPASS eNPU masters to the ADSP
> iommus list. These masters are exercised during audio record
> use cases where Environmental Acoustic Intelligence (EAI)
> models run on the eNPUs.
> 
> Currently all transactions from these eNPU masters will result
> in global faults; fix them by adding the additional SIDs.
> 
> Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
> Signed-off-by: Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
> Co-developed-by: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>
> Signed-off-by: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
