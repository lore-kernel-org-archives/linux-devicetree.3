Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263046;
	b=Dl8WilRrlsH5E92RdCvAJq+mKKiw79wfKju3jP9O5hFc+e/guBy87U9AUK99b8n081Qp
	 xj99DNbnS46Zob27N1Dgziiv4CLKK3K7fZDvfV6KrY/2hx/4XXyNC2bBLPCaoqlYe2vPN
	 ovDV/hDDaaXndWlUXI7P96hf3T6ieqrsTEODR7UTTYKiEOAnSnEfUVcmZZtEITdCPfhEW
	 Axf3a1tvcoLtmiDcCXlEK5F+ojcBvX+vLyWYIic38K7Sy9AAbfMbSXgbevPUULZDvaFJ7
	 CqhP3DYesBmH4Ip1FY/vD6lTzsutPO4+7bS3dcutgYSVHxzJ4gN5YHSJmFbHjczegng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263046;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fVa/mvUfwBbO40HIIbPEdimnS4j323pWkTjt0VcUg4c=;
	b=EHLZEJSdDQlA2dXnKzke2G4NRQkrMVEUEjtUm9Yd7sj7bGN0oEkdof9KX2ccMCU6gIou
	 0hFNBfMs1PP+8XqFy+6jS10cWQgt/8Vn68i7WQtl//V2me9Qb/f6/qfIct5hkA1utIBh+
	 UoNdqlspwK/OwNUVJStfXsUjCgIL349wWQt5kGojFD1uZ2H6Vi0Jt/jr7QZGNpZRtVBir
	 ILsQDvB/i29Si44/EEjXqzTpqe9gr3RRl6vVVgUaDDg6dzdjMjp2ACvv+mcgTvH8yVjGm
	 eF+4y/6fFY7kFkb6Y4U/Ldchy/M96hw+H7XgVRd19dLf/CSxxLs71eG39aQid+GdPAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G76ACjgX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZyYmv8h4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E3B606A31A
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78E3B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G76ACjgX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZyYmv8h4
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5HVQs1793309
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fVa/mvUfwBbO40HIIbPEdimn
	S4j323pWkTjt0VcUg4c=; b=G76ACjgXP/uXzaO4MxiTtGYBkSKqGy3Izb6p3o3p
	mGzza3fRsWQ4CdCCdapWpfmjbKtQeVrnDVglQdbhOYNmGCnhXfY+EcOn8TM9/zEO
	Qzby97a3wvajxI7IojFE3q/UFDWeHHgt2KQE3sZTeC+aGpDjCn+ca1U05WivBNcU
	nuRo3bOfKbr1R0ftOs0bVIJIAVrO7mb6DYSTAF75bNDPEzLYDV8xPlUDiwuNPvc0
	Ea5oUeoG8GHMTVF2SjU+KaxWYJn5aj0e3htrHoE85VGc3K8Moi9gFPVDJS1dPYVi
	d7WQZ2HzWtk/X4WBsTil/3ljF28uYGfWpK9Mk9cZDBzW9w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtnm46m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:37:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5376f1853bfso39559531cf.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 01:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793263045; x=1793867845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fVa/mvUfwBbO40HIIbPEdimnS4j323pWkTjt0VcUg4c=;
        b=ZyYmv8h4eHFljzuFGrQgwUIr47K2hfDQkP4jGkxQyCvFqd5vEsB01ea9Dqcxep46pQ
         vCUxdY/65D2JvNLiDXeNqxftMg8rKugnt/Tb+efWm0Y4Uu1o8h5B921qYIJBN04JDhJk
         llHvF9LYhDxDeBRf7L43Y1AYvJryewSKuhuLrRupTsOA2HtNnoSwDMNhPcqR/yl9MFUM
         ef9RYTyH4RXF8nbMTf+2Gdm1LGmf+Tir+FMzMdS8hPUkkQ0Sk7XPQa7a7XwA68ZQnksO
         TObSU+verXgIctKFwxgSjjY5p1UsXPzqF+CwNku4ELg4CmQU8KDlZjC2UHI5C0goCEji
         e6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263045; x=1793867845;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fVa/mvUfwBbO40HIIbPEdimnS4j323pWkTjt0VcUg4c=;
        b=PWpogem82S80wci20EATubM/w3363EulIDhxTAVkOzTaekgNQAQeoFdFQ7OCj+mqzS
         pHTG+tpfnN7LncMO8r2crKdIB7X6dnwpeAvVpBSaMwkFjT3EvZFJqZhKySd1cNYxRN8f
         eI/K1CIX3o1eDmmySdGob1MTrXWfLqRFbw258T1tYYL5C5REVziZhIj2T1AKwrzhArs5
         pgJsLF6ZD/wPrkzb+axSntj1urjveyLNElqC0TszEeD7fouen3Az7Z3xALkpCApFwV8m
         oU7TuHJ/2mIakDS2GdTcAclEtPsIYCcNzxbabNDzBfHuJqoekqCAEAJip5tyWLyac9vE
         yMgA==
X-Forwarded-Encrypted: i=1; AKwUvBxw7JE6gNVNDTwlLxvSEbfkCohYuM+Djko5rB/Lf16nM/EeLpXIbxucE4fA5B/3/H9Th3KozGhw9UZ5@vger.kernel.org
X-Gm-Message-State: AFq9FYKZwWndeSsU4Y4uYeUTJI9JojV3RRBfjhidE5c4jP8ftuP/Srj+
	akBUlyaxCf8bGzT0wxyNQKm+RWbKJE2CUA5IOrspUzTDlcVUWlqwPosrwgVtOY0mEPiljzf9HKd
	AGNpe3CqehedFJoyzSulY6GhbrvpPLI+yfvwwZnXqaKsIzfsi3cB6hsfYpnNCuBV5
X-Gm-Gg: AYBFou33uimTLv4ewm3qjlipZbgbOW23GOjb62vMJYsJ1dIlw2cUlswuvNloMdA5cVA
	0vzVPszMCTddMdFtEM271GwuPdeZPDRGiKSj8GymsIrgb8Inke63+84UIyabrjCSPyXwXI9Sg5H
	nvtLBoBKTzEhTaYsxOXEecA0vrxgOLGsckQ2I5QQTVQ9yOhHzRqu8P3kK7WYuyxGK+Qi9DVQjZ1
	6flRSzsqoMSuLeU18C33C15E5CAxo5Ke1PRX2kcvCyKCHFqCtfFgn8HM6MLQ21x0TMWixwGTyzW
	AnMxUFCs44RA5yzRM2SKmxk83Wj25fyPfKXgdqxMH4yWM8YDBz+zqTOqO2rzjrBK2fB4rpvXBQ6
	9OjAUaCPOTUcs9JBmd2PjTeGlwJkWDBgQPDSf/ffefASg3IypnOV4/HbSw69YyS6n
X-Received: by 2002:ac8:59cd:0:b0:535:1f7a:e29c with SMTP id d75a77b69052e-53fcb7fd72amr73061491cf.37.1793263044573;
        Thu, 29 Oct 2026 01:37:24 -0700 (PDT)
X-Received: by 2002:ac8:59cd:0:b0:535:1f7a:e29c with SMTP id d75a77b69052e-53fcb7fd72amr73061161cf.37.1793263044021;
        Thu, 29 Oct 2026 01:37:24 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd354asm31506527f8f.43.2026.10.29.01.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:37:23 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:37:21 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur-crd: Drop L4F0
Message-ID: <mor4cxzv3iozz6tyjl62ib4dyndlxp6uluhzebardpgswujkkl@oi5tzh5vvafn>
References: <20261028-topic-sip_cob-v1-0-80ab6704aca3@oss.qualcomm.com>
 <20261028-topic-sip_cob-v1-3-80ab6704aca3@oss.qualcomm.com>
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
In-Reply-To: <20261028-topic-sip_cob-v1-3-80ab6704aca3@oss.qualcomm.com>
X-Proofpoint-GUID: SpH-OE83PHE-PdrIP5aehYG1e_L_syDD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfX1D2gvRjIUsMh
 m+Px3alLe63pNuM5DD/ZZY1F2cP1eN/IPFNNkaIa+lV2J/QOSX1gpi+JjTaSRVHQ2AmXnskexie
 1kg4d7MX6X7cbei88EwWAOLxdl2YYCaJvGx3JFmrngb7Aw13xvFmg7xawmeX0/HQLBPr5oG1suN
 G5SYt3/ED2w1IkR4N37wxuaXYKGZNux0NSnCqyc6ez2TJeULA7n4T4jiRR7k8jUgOucEIXeNDrp
 MjE7ck81HDDbvXABLP34ZhoTILkIT9irHvtHN/zf2UKZNp3ODJyJD0mP7IC60whSbx7nRmIh8r+
 RDtaVU0kuCWMOIZZS4YoRq4PqDDepAsUHiZqH7oAkD6w4PY3qgTPNDxzkNQ0MB6vFcxVIhijMwd
 QxfNthVxpH8myoGsSVmy9UIzDpFf43zMqFMgrS9OKmYfkBPIh1xx1MsSnNtBDN9LLimsTaVMR3F
 IG/B8qQ4he6iu5sqppw==
X-Authority-Analysis: v=2.4 cv=c/A+0h9l c=1 sm=1 tr=0 ts=6ae305c5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2GcbamvMf4vLJYqmZ1cA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: SpH-OE83PHE-PdrIP5aehYG1e_L_syDD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfX9Ygs15+Dynbe
 h2XJm1ivyS5palCFBS9VO5EA3XoTtXFMQ3OU0HTODx3aq0WjNZ1SxwXotViopwyH/ttge5oV9e5
 gspPsGw9ZhsnHPI59lXshNFrKLWpm+g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290033

On 26-10-28 21:04:26, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This is VDD_LPI_MX, already controlled by RPMH as an ARC/RPMHPD.
> Drop it.
> 
> Fixes: a5ad8a8e473c ("arm64: dts: qcom: Commonize Glymur CRD DTSI")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
