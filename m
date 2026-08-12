Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63CF4266B2
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786531106; cv=none; b=WG7ZK+tW93iYAsKN6q27t9ALBjOS2Lc3lo9qa7qHt9UTWWjuuPAW1au3WNDY7k+IiSSrmWVS4b6H02Nw6IIqf1Kqm5ruv9XtxgFAO6boqf6cOsE8o5kPlZgQMrVBpU4agvBR0ZrhTbIDhsrTNmfQUVi8J7uWb5raVpPGnHkHZwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786531106; c=relaxed/simple;
	bh=G6nnn8lnI/rAQnJZUiW5JYuXE7stAT7iHzHztmkWFvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y46jJaIxEM8RkPUYrHy61ZVlXecUk193c5UpudM5+fTary4qcP37a7EdT8spxXSaUx9hmprUkMbZvPosFNuRmq0uhO4DFhmKKprh4eb9w5wwguQPyzYT3FGEEGfYZa2O21/2yCVSuRzSuAXT6Z2DGzDvL9dgxWf3M9VZ1asklKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zem9bwqg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ll+sdS3j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zem9bwqg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ll+sdS3j"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9ffs03082697
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:38:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=43KTu31La2PYMIbt6lJPyOwV
	3t7WZvfSsJa13upD3Xw=; b=Zem9bwqghfE7dJj+edn3DOY4bIRGhplx30Jib1j8
	OL3/GGlv7uAWMDU/A9ocXZ+RHjc/Me21QHsBJK1yDerAa6uFRlTIBRmtXVh09mXO
	hqlOQDuQgOiO3fb42ghu9POjTT7JgbFonwsZIvszwiMD7zUDT036gIFoVxcMx8mO
	kGy+ZekgD+c/6+kmnvNUld9q4jfTpnwV+i0YUB/A71Uv1qBfZ+7Dnxu8UpGSMJaf
	betWs7kBcL7+s9+VlqaXoa7Bb4UHb3zedbFbdjqnwy6gOThkOs8ZMx37Cy9zrmLr
	rlY/icLz8Esu5r0t051CHzXteMcSOB6feHzLXakNXNtU/w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g08jrkdcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:38:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0408254aso26753051cf.0
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 03:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786531101; x=1787135901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=43KTu31La2PYMIbt6lJPyOwV3t7WZvfSsJa13upD3Xw=;
        b=Ll+sdS3j3yorvDrijmUbnRYGM7B0vd3yin+mRGN8lH+r7Slq3E91giDC1HMYNWpezX
         RjDZ/eY2Wt5g5dPu6aK4DDNDraoTYggFzULU3Kp1LzhLeOUPB6NkzLK6D5bzhRAuMr/s
         D5+5YsBNfjKpb/F/1DQnHQVvnyZYI3KgUexbAcP2lOcgbaOKDdGUu2tozZKbZ6JsRjk7
         BV4/iYCRv54mRVvoaCzZvTl0jWdCvCGGC85Xn+iKVPu6vH+qtmLjG5xHyt0KbGH2saFs
         6HrZr8yj1fI4BcBlL5UV25PR24e82jCluHnmKNEMMqvFtD2cz7oR0p6qLFWbK+9gLYyY
         uqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786531101; x=1787135901;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=43KTu31La2PYMIbt6lJPyOwV3t7WZvfSsJa13upD3Xw=;
        b=AJwj8+Ax5BtjnzRlA5jLJXTov+VHoyO+kNySw/H3EnMESqXOZhTx0iDOSShP5vMTF3
         3VOsjJ2PMfhh7ivWMmHTQiUtSubNVtf7u7W8ROyrvqJ8prpgMPz1AZ+CVhGLSoeP6CyL
         2s+WJQG+fqrqj0E/plySAp4k2p+oPRZLTZWte1sfMBulYJrXfRi6mA4HHKaYMkf4AxSy
         7rC5imc0Lyy/lvdt3YlObWKrej9p8hrMvHbiqD02cbV4d4yZl1w4mBLrVryBUdqKZw6o
         dtjzR3JBzzJqXTnro25HXyogw0ON35NzqcshM0rMwqLqqEE9UNvz3Np+lgXfKpoBcPbF
         Yjjg==
X-Forwarded-Encrypted: i=1; AHgh+Rr9o0m1BdJvO0ocuf92gl6mlGtiMM3jtEeOOyPhQ0kwwCKvMP4kVlF49A5EU+zxNiyd6h3r6o7eYWcf@vger.kernel.org
X-Gm-Message-State: AOJu0YyiOer/vbrPLaDm5AZWDsGIQ7Nrw7P+F0bJ/mS/J9oFVTT8Gjyw
	NZUS3aW3SwJHesEfgH/rta4rOjF+r2lL/MAhoEGT3jMLgUHwcLGGKhqYSRC+C8eziRSPJcveqYk
	o8pKkRv5MYwDXdJwsfbHIDZmaBDDWWjLeaoS2f30B2GQ/GMX9c9gkgRotnSIR2rqs
X-Gm-Gg: AR+sD11iKMDrQM7MWew6L1/xOg1yRk1/v3rNKGrKSXhSvSrz6Kvdjp/PG7LkKsTkshF
	4onsqNbIBvXKenmZI7DAmHniDT8Nos97z/499fxcDDEk/3g8pBETKWXylf6dy84IHfqn0bxaOJq
	/vVMA/38pb/smQmbuc9K+WpS3xpvKmetqSblloxGEPBT4oH7f2uVZ8AsLshj+V0hah2yUVmQT1w
	qjlY6rp+yFvXRuNjMWUCr8uc96pchAcdnQmBwnZnNrKG0wwMxax8pKdhvDwZ2XOQ4gaOae1/ujv
	ANauJ7DxN/AYbz1mxmhrnJMNaM5PqmwHYZZsl6z27ewr0jekORnNCFVWUCnVEOHXD5YFvJK07U9
	FH9BU93cHmnUltBA=
X-Received: by 2002:a05:622a:a1a:b0:517:6fc2:4760 with SMTP id d75a77b69052e-52d6020616amr55283301cf.9.1786531101010;
        Wed, 12 Aug 2026 03:38:21 -0700 (PDT)
X-Received: by 2002:a05:622a:a1a:b0:517:6fc2:4760 with SMTP id d75a77b69052e-52d6020616amr55283001cf.9.1786531100460;
        Wed, 12 Aug 2026 03:38:20 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aaa4d2fsm64264225e9.1.2026.08.12.03.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:38:19 -0700 (PDT)
Date: Wed, 12 Aug 2026 13:38:17 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH V4 3/4] arm64: dts: qcom: Add SD Card support for Glymur
 SoC
Message-ID: <g6bz7algefohohi6q6zg2liajwyuqgpnugwcjsfq7mmocte5xr@4nkifjgu6l7w>
References: <20260722142342.990384-1-mchunara@oss.qualcomm.com>
 <20260722142342.990384-4-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722142342.990384-4-mchunara@oss.qualcomm.com>
X-Proofpoint-GUID: h3m8fbWxTlv2yPKAy49vfF3C-23lfGxe
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA4NSBTYWx0ZWRfX1lwWCqgNlam4
 JeKf63NbBcgcNFJwa/UUCKmZD9kEB1PkWebgxiGsa3phHZd0zzOSd64rkyg1varr+qeM6CprFJa
 xYI3OlsSMPqn5fLJKTJAAGPWdRD3OZM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA4NSBTYWx0ZWRfX9Oh/D1rxiyFY
 jEfdUBTPLILtXHN70Kld2iMCNilNJFAk5aTEhF9WZJHke/ByNlRRUJCFAJbQU/QZYN55JM0g9jY
 73etzJyFrRR7wX9gnmvXYrMCgQQJ5LtX67wc2dlvH1+c3sXLjkybHmZ74kKw53ZWwGb5QyHQaXb
 rN0UY4gsiKK8uSiVBk2pj6k5Vo+GUeJ7Sy+1p+QIBIIQ9Og/4778xOWMne5/eeyravLNh6utEZw
 ubz67HM5Rm3Fl3v7WHeDvnNX7r4joOQRQS5YeU99wFQuwQ8izpHYqnNPjCk7g34d0WDS+nWlLpc
 ehCfVNaYr+zGV0XMcQY9eJPQ4imc1z9+kfsNCG9og1aIUsKi/yG4sBkm33UHI3T3A8dYBhFLXyo
 yl+fOb/89cGV+ueBif6nunaG2jhtDLv/7jFCemMwapINKwM5Up1SyytqKT2w/fv6ws/lEF+v05E
 Ldmw51cUzd0qQwpvPNA==
X-Authority-Analysis: v=2.4 cv=Z7Dc2nRA c=1 sm=1 tr=0 ts=6a7c4d1e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=o07dIpAjZdj6OISZKn0kaw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FZAofsGHiTNuLk9495wA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: h3m8fbWxTlv2yPKAy49vfF3C-23lfGxe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120085

On 26-07-22 19:53:41, Monish Chunara wrote:
> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> Add support for SD card on Glymur SoC and enable the required pinctrl
> configurations.
> 
> Co-developed-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
> Signed-off-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
