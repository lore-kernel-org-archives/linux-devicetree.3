Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213843;
	b=VEotgZHadQnSzTHn2PoHBwDIXDc8PDaiHSt9E3528fO8EoEekVPwFTvrSjE8BD8qqTCo
	 Oo2KFXXVIcB3xXlCZ84JtBDC/0M5/qpVxHdfRTvDYvhDcevfif8smv2s725u+dobhWTr3
	 bGyuK8YiCQPe2wpwXNKEijerJRwjgwRBo6yQvt5/cq+85U8aOJFMAwGAxEZTNExs7QOIJ
	 8V0BvakYrSlKKjizKfPdeOcSdbgKhg+OrWFCsHj+oKKwJTf19aHoNuLgBvARzFS5PUlKG
	 RjX/d2CPpDErU6TODx8okjVnvY7AZWMTOyZUL+B/hQCieO6PUikC/sOiAvU58LO87Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213843;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mprexWtZNDRMwk+G2v0uaj8aq1dqkuFGRNlm1HMFGvM=;
	b=mcCTJ/v2p8qf5gBWwLSefPO+3tfXnkZs5LopfUrtbjJVfdVynIne9HYSx0pZgXXbqawg
	 psqP4XBFo5mpfh4ZE4ZCrXaOnEmXMbHo2srLpivIH7VXWetj0YntWNU+rEFIiUkJ/MuPY
	 UN4Wp1WD/4U6l03BPt1xKYb3tHvOYkzwb67NslRl+iZsD8dFDvsLmwCEzy8rIRmgFPWv/
	 SrG1LvoQAMqSVahyuj3ZY+yOqd3FvbMdHFx6GC6GUBznqn3dgBLj+nD2L5qPLTmN7MKUz
	 ZsFc+0GbhJWTXa0/2+sDgY4UPzg5bCtXumIRQLCGrkL7Fj2BbOTuCVvMeBiezCBrSYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Oj0eK2u/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dUmWnG0s;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EBA606EE80
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 08:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9EBA606EE80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Oj0eK2u/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dUmWnG0s
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96ASaX2007764
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 08:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mprexWtZNDRMwk+G2v0uaj8a
	q1dqkuFGRNlm1HMFGvM=; b=Oj0eK2u/6vE3/0SZR97f0Xlk1Cj+xcfdD2fZs0E1
	LFdYZqTN2Rd7Da5RKdTijzNs1u0mb1EGkCEBuCc+1/0yAnTfHwXYZMb68kj7QqS3
	B4aOYjHD33ezrZmPXVcHfw0fDSo6boNqyq9q2iVeAZ/bAoxGnwMjQVhQdEiKDoeT
	A/l+W7j8S7COn2fHrsjTgQrquo5oN3Yfg5ZTfJPQOO9EnM04u+eKKehI9UIymAOB
	4sakDt95XRdFrXQcEGfqUnC0zWRUas+HNEzF/Dx8HAApATTM9WCP/Nfc3onCjgZQ
	XYptwiXqlSX+KoBZTTrRYUMCuVCKS+G7ouChq4VjPKWxOQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw5k5aes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 08:44:02 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d2eba206f4so500543137.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 00:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794213841; x=1794818641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mprexWtZNDRMwk+G2v0uaj8aq1dqkuFGRNlm1HMFGvM=;
        b=dUmWnG0sZkUcFV0ud8mzOU3tbo2RFWh5gWof52clB6BfeJKT3FMeT4adbITA02fw12
         fZ7Tdt7NDsDR4vHUyVtq3ofwn7N5Zn7mK0h9uqP9dcH1VxIppbXwFsH/J2sDBm2Axe+h
         +v+ZX/4YA17vadvq/RIhVeir4Q36Qo/LJUuQUsfeiRYPhu8Rnzs5bo9npgacenzmrYmj
         //7lxgJ7jo49rCFeOIsINnVnphGKe4PJI54K8qy0cC8MySM4rz3m+5c3RpJ7SHXLBNyi
         yMBENRvTWju75+pBBs7kNQ5gpSv4ezeGQaQqTpWVrxZtwK4S963ssu4cNdYXZo/yAugx
         e29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213841; x=1794818641;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mprexWtZNDRMwk+G2v0uaj8aq1dqkuFGRNlm1HMFGvM=;
        b=M2A1ki1GaEhvJCq7YrOcAeAnPhkuVA4seh/12vKPfBQXvfPOUCAv6T2bHyevhpxV8v
         FABv8/qRI+lWguB+COxwgFgNb3jP9tMM2EZ6efA6fLt6W2mQF6+VlCzSCFVZ/W91z9fS
         tF6yJpNN2PVUe4cU2ZTaAP98vcsw4K1Vftu5nx/1dwQSh67MNvrJ3L3fhFiCZcbySJpt
         oG43t7FlcDaO24zYUlXSBuYYCn53iy1LU1/BALscOKOpUevcrAEtS+GyV/RffOCyPhjp
         v+FmtkHg/tYuMjn8lYL3ZLc8Fdys6CshFfraejjcfPCfrOaRJxbVrWicj4YWoZ+XIZSm
         qkiA==
X-Forwarded-Encrypted: i=1; AL+hErG2J9ob5Qmkwu6WPQPd88Y6oZ2oDLdJLdspUbYFSfIcSkNj45hQx2pPoKsoTOMPfunTIor088bKC/XW@vger.kernel.org
X-Gm-Message-State: APuU4Z9dkH03V9fgwYio+Q5l545MN/oUTbu4R8k5kY4wbFGPJAp8exue
	qN35SWvUnK2f1n0Yn67wAFmwOx7wJKgESxEUUfN/o4g4RSlJknd36oKkoZJCN2YbB4KtD0o4twg
	SEmB+Oae++x9kHGuWHUMR3ASthu6q/S6xhvQYI2kKsvplP0gpfpJzDPE//ZbDIkP+
X-Gm-Gg: AYBFou08AumtrxhcSNAr3Q17f6ERTGfIk5zBrgbl0vGuc7hx+8SAWggrGUVdU8AYO7w
	13pLGGaQIJUXA0B+7hYacm38rVGAkZBvYhZL4jP4FLAs/yeZNi3xVH0Oi3BylZ3BTUjk9dCoxnA
	7MTX/Wi3kgvYTwJw0U/0qCKrDOWLoJfYdfQRPQcF+hAhjwTjthxqAQ9jd7Yu5qm6KxaggNIw0Pp
	8NoW/8r/f/1Y82n+nc778hWuQH0igTR22cx8rxy1+oO3HnajifPOG+fHQE+PXvR/V1aZSSjVS6o
	bwBOZGPC9pj1QLlJtgcxIHXzFc/lDNde9TTE+XFVcL7s25qf3wVkbmFrgjcdlYdA3K2WuJpMxBu
	oQlfWTpzDW4cQ3QccHv0nE+peX7ZDfjtGO6ts/08cWDGnmbLvUi/YFe6qHCm1e3c=
X-Received: by 2002:a05:6102:3309:b0:7a6:b18e:6d24 with SMTP id ada2fe7eead31-7d2db220cccmr890398137.23.1794213840890;
        Mon, 09 Nov 2026 00:44:00 -0800 (PST)
X-Received: by 2002:a05:6102:3309:b0:7a6:b18e:6d24 with SMTP id ada2fe7eead31-7d2db220cccmr890389137.23.1794213840331;
        Mon, 09 Nov 2026 00:44:00 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597371cc4sm8264698f8f.36.2026.11.09.00.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:43:59 -0800 (PST)
Date: Mon, 9 Nov 2026 10:43:57 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/8] arm64: dts: qcom: glymur-crd: Fix L8B0 voltage
Message-ID: <qsrxmnicjhmdsdkvcl3nnymgsq5rydacirrp32cj457twaryy2@xl57osz2nawx>
References: <20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com>
 <20261106-topic-sip_cob-v3-4-52cd3826ab49@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-topic-sip_cob-v3-4-52cd3826ab49@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX9CH5KgmP6opg
 xHQm74lc0tVjeaQrAcCztvfaH0tFAprKzaPzq/LKRhZ+ulaC/X7/01R6UeTbXtZYdS7JKI41SuC
 AXfT9nTw9SuMZd5cWpTcftFUpwiQyDgg0XllOa4PNy32pGnO/kf3qZVyUjnut6zM/aLdkvP6SmC
 FK0b1FaNgBtGXZUWJfezBRXtyYit1qi0tsw+FtoZ6N01PeHlxtWIsHL2FTgck4XvXPkqgM/kGvl
 gl5Fnea1n2rRJefdy2JrkWSaPqJv7DumMIs9rw/D+zg6K4Ovfd7sGqHIgXh1Y/JWIOejYXyLljZ
 WRcYC/dEJ443aICLnzy7kJ6dE5nArkKEAqCBwIhYDFI+mwbjySS5dPMlN8HbyygcNIeAbAAlzvA
 oesuO3V3dIbyvGgNKWDysLYONqp2xan7e1wV5SAZCacBl6Bu7iQiF+sTEL9XqNzzecYpxpAJiid
 rZDdOpiqwX42Qh90b1Q==
X-Proofpoint-ORIG-GUID: MeGSI4gX956MsZgSoCV7PO1-OJTnUe-l
X-Proofpoint-GUID: MeGSI4gX956MsZgSoCV7PO1-OJTnUe-l
X-Authority-Analysis: v=2.4 cv=G/aJgNk5 c=1 sm=1 tr=0 ts=6af187d2 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ZkbxzI2-Od9abTRmLGAA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfXw3uVhImjQAGo
 ok2+m8a2lIEe2o3CiOgwrpxr7/V0gECNWrmFLCIevP0JNNOoFkLqfdmeavqgRnVr3gsj/NUxB+9
 lH3dycJL3iL4U4zCqli6XL4Ns8UIn6g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034

On 26-11-06 10:29:05, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> L8B0 supplies the 3.3 V rail of the PTN3222 eUSB2 repeaters, but is
> configured to 1.504 V. Set it to the right range.
> 
> Fixes: 9314c6ecace1 ("arm64: dts: qcom: glymur: Enable Glymur CRD board support")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
