Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA19041F379
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113317; cv=none; b=nrvH9/CUhy5Y8xlHTkbz/ps6k9IjXUx6rDO+/vtf8re8dN2ck6TZ1QFTM3knjVcHh53GuaGKqVUiobncH1/Nh+artXonaJ1woEUQ8JkiG3jKXGsRdK9Y8V/45PI1enH5NQFjlkX+fBv5og0M8zx3Wgl21aIX/4wdOm7X3FSlDAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113317; c=relaxed/simple;
	bh=O34+r1YZ7TDdI1Iy7Ca4KVAKGyvasa+GgSOSDmSxYzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXHkluIWXo+aCuQ29S+wG5yMneZ2fUoLkh2ymfDJkxGuqbWIJf4D1/yhk4N2DowC+FuIrP02ktf3iSWazyO+tPGuAx06J8IBwNwLlNJoEJfpo0CgpfJg8AxK4p4IMhdZEHUAr2PMc/9xpKqfIQzwOULayjHk3bJoBikmn5VWWnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U7t8MuX4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e37B3Qw+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U7t8MuX4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e37B3Qw+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7l53A3017652
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/EqSpgdpfU++hk6ztbTemQXV
	lN5QhkWBg4oQrvfqIUA=; b=U7t8MuX43pbI2ENtM2peEx9jKWwe0FwmPGJIsgYU
	eluk+wfLTDOzXoI7iwHrXLS+bLKEWQ3V7f1ZAWAdFtw1jd5TltiKWZRdiN11GDbu
	6TUvAMk1oK00Ir0B00mAKNWxG0U7kPT81eKTetvKKSSBK/MIh1axpMUj4a26yqPS
	7BDV/mtlvw2vlcAGem5971sOYUY01ARjHogi4MnsFvvjkdTldWoiQa/kcVUceHYP
	+jOJbDnmxY9+Gdz3qTQDPup19vfIFfmhizyzX2hcDiLEUFbk69BnGrP+ZVl8DCBt
	3nx8rKxr89CDrudKbmI6KQ/JdXAyLuePYprjj4pcqPBrqg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwvx43xp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:55:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9382f9430deso107937985a.1
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 00:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789113314; x=1789718114; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/EqSpgdpfU++hk6ztbTemQXVlN5QhkWBg4oQrvfqIUA=;
        b=e37B3Qw+qVScyz1Q6NPErZFBcJ0IdLrU71r0zBGZ8yfhZs0C1QCP/295kO5kDtSrZ0
         K8KZoxVLHGbKjYjdwcZf85wrqV//8FDqmrx4yk9kc3b9TcbE/OuqAIJG2ATAvGk3mlD1
         V20vUjAZewCUH8q5bXdyB4dn4ev+f810WQy3c0ks/TP8B7Z0FGueffKD+tfngPHdfodE
         5dkIoSuVGIFXy3FfAUuR/3fYJ2GFMHCUCzceVwbwkX3+mRZPK1HUXqz3vQUGdGoIfC7K
         +Yu03ACu2y84So717hP8evpl12wbke2i+4kMJ+lnhxQYN7or4BmIYOsaL3UktVLh4Oet
         pdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789113314; x=1789718114;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/EqSpgdpfU++hk6ztbTemQXVlN5QhkWBg4oQrvfqIUA=;
        b=fuVjfHbdQE4yu4vUgS6dreBztO98LyUPNgSrJuJyJcoiD+iGX47AyvGc+UJWl6mSZG
         MG1ziJ+3T7LZhTvjrMX0jbaTkMCYQcIOajVWcts+uTXRmWHFfeocOLjmeseo7g5hawhd
         7dLyV5FJ/wt19ZplPss4RqK96X57lUmLWlDHYQlJU0krobUQwhIUSTI95Dz9fDKBlp8Z
         7stKc4Pz5qEDtqdJStjGafRHRq2A8Gsf5W15gBJNUuxnXRJox1vZ6oSZd0PqQEahumJR
         6Oeif+lkLvPVdLgODyLJNWit+qJDF111jFBGABR6LexqlztgLWdSTmzdh4eighzwjoqS
         XZyA==
X-Forwarded-Encrypted: i=1; AKwUvBwaag6wrDPvFR2Nu7o93yD71m09fGZLma0G3xooveZMARuCYm1XOiPogM3XN6SSmiE2M1TOwVp2pwo9@vger.kernel.org
X-Gm-Message-State: AFuF++lZf5NjxnZvh78df8OeK1rudQVbY0hVQLqLU2oS+fk1iCNfu7yA
	qfxlsqYmDFFZ1y05bsuThZE8N0pZTPHXPfiIzetTSfCswMv8a9MaxiKR8B3H3+Fx7wVirkWJm3A
	iMOUsxlmG9BuQfOSQPzuDOeWJiTK21eACA8/dFkT8wtnx5fVPRtpuTnnOoGkgOG1e
X-Gm-Gg: AYBFou219lfDGd/og69q5ZnuXaALVzL9ytZ11HeOhLBv3fnZIEOL4qKQK6gbE67bL+N
	oAWX6oAlj0BdMOQIfdL20ttPpZ9q+S21bT8RqJ3UcsDYXM/sLY6hnfX4CVQoF+3hvSQ4W87fp+x
	RxOSB8Yo0KXdvE3UzKpuuHp5sw+9VAZHyqZqUF3dgxkXYRs4a8LmBH9t9qXc1zdmJr+S0so8X8m
	MuDfXUgcTN6+cSxGpYTFKVwyvs4Gi/wMbA9ULwQ09mM04oSHgVr4NyZEmJIlgQr5qBRs6y2/D2e
	DJkdlZfSJwrLro7aXvPo5HBRyzWRG6W+V55dIzRP05lPkBeWJQulE8Duf5STeLL9P0nos0Zjp3y
	6mb2ku5pTxjjDeg==
X-Received: by 2002:a05:620a:bd4:b0:939:d78c:eb0c with SMTP id af79cd13be357-939ea043190mr343501285a.11.1789113313829;
        Fri, 11 Sep 2026 00:55:13 -0700 (PDT)
X-Received: by 2002:a05:620a:bd4:b0:939:d78c:eb0c with SMTP id af79cd13be357-939ea043190mr343497985a.11.1789113313314;
        Fri, 11 Sep 2026 00:55:13 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a33e34sm35304905e9.0.2026.09.11.00.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 00:55:11 -0700 (PDT)
Date: Fri, 11 Sep 2026 10:55:09 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH v8 1/3] arm64: dts: qcom: shikra: sort /soc@0 nodes by
 unit address
Message-ID: <wceerxzuwlhj6qzut6lxcl7ahxygbxzyjkwp4h5olb2oenvsuo@m32szrolqkjl>
References: <20260911-usb-shikra-v7-v8-0-851ee4bc0eec@oss.qualcomm.com>
 <20260911-usb-shikra-v7-v8-1-851ee4bc0eec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-usb-shikra-v7-v8-1-851ee4bc0eec@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEwOSBTYWx0ZWRfX1QC/M1zn4NuB
 7bX1Uk29gJNDuS6qUDznpbHgmhwiYJEkI7XsjXGSIdBNu800tGIugtKlq+asDMRj33icGBeaS4l
 qsqrdYZHg1DvXfgOHR4jS4NLKza/xn4qbOmmtvnVjwXGGHQJiqraK0Fa2gflBpQPmyK0KxKEugi
 UYxFQLv3v6KSiidrlHqMj3gGmHHaCtxnSaU04JisJh/kEQoP/yzZEfb4CQR3JpTNoeClrEtWG0S
 BSJ4wFf5aEUnromxAvktGt0PZybQW/PeeiGSGdR+l0XlpdyCk3/00chrW/aQtdwvd8chNDNNmya
 EGNbXNhUmwsSIc6+pV3mRYt3Z64BiHjXoxyDcCciFCZr2L4GwX/kGgvnp5GN3tzxMI8Eh8EEFQ+
 8F2zIurwJImRdsQ7uTRsz1plVNDZYjR9XrJ4adJg9can/f6JhY738Q/z0RMI84N2HDDh2tpabb0
 j2cL1d0zG0eUhqQb7rg==
X-Proofpoint-ORIG-GUID: hgyMq9ieR4opKabbnNGkHK4GSaU_Qxjw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEwOSBTYWx0ZWRfX4Ax5b6e2uRRr
 MqNTllzKSBy2VOtOt0ImNpG458CM53zcdUuIpLd+j09+DUCylrpc7u/7YjDId4rRHViqyGCYZtu
 h01nmBnC6rtL5EpRrqb0KpiCs+jvm9o=
X-Authority-Analysis: v=2.4 cv=AdkkjHXG c=1 sm=1 tr=0 ts=6aa3b3e3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=99Sh8nnqGf6VeWgbmrYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: hgyMq9ieR4opKabbnNGkHK4GSaU_Qxjw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110109

On 26-09-11 11:37:18, Komal Bajaj wrote:
> Sort /soc@0 subnodes in ascending order of unit address.
> Reorder the misplaced nodes so their declaration order matches
> increasing node addresses.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
