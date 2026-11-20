Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168185;
	b=swibWbIqBcGnkhXwfIRhaejSHBor6FpNvGFsst1iz9jiV7XXjOtPT67eCdKKDcd7Hm0o
	 WlgZWfbto255DviwPMm0VL5Wmcheg76u9VXGkZNnMPLyOHHwMedJlaXASKctV/FWtABtw
	 a5b8ST9VJbNMrR0SnbGO6M6U/T7X9ypA8N2STKGi1/4sFa6ElmKKtwQmrmoJMsEFwc41R
	 EVxYBprRHciXn32TlAshEz8Sp6ra38vhE3FViIi7q662LGaG+Wsli18+LjCfLPjNDZ/+0
	 kQ7X6VW0k9k0oT/9d3zXBTkrU2Wy6kuqFA0SCgi4cbU61VBOvik8AqQ7aTMnT2TxsdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168185;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3Qobe5Koi0hqdQPSNyvly2xZNog+FVkjUKeG4gVX+Ls=;
	b=DMa7R9CB8VzcsVnyi5LFCt3r9xm+7ghnzxC8xc7PbviAvwYFrZCmU71Gg3YpG5a8rt3p
	 q0r7COcVOYjj/LhH31H5Z6amd3gzsCZEo3qCHrJLs1lzI4kHwnPi9bzW+Ti/aLh8Xjvjo
	 LRJ9azWOYN5O0xf8z76kQ8Z5FwWrq2GHAdagMOG6SJTHKesZCQVF7MHUMcGz5cGTfUeLf
	 NtMG48wMMoiK9DgHYL+PkrS3PHeEi8XL5uQ2qtRnz84xv0SPO5zdt2rsTIO/pDDbFT2h0
	 ZL2Pnd3JR9gwMk+YjJScbRQl+SCnxYcxSHzNLKls5Pbex2Udtbsy/xpT6oMWDnObX5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bRT9DmCy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f2Uq1hnP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973F6606A32C
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 973F6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bRT9DmCy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f2Uq1hnP
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7eq0E1268332
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3Qobe5Koi0hqdQPSNyvly2xZ
	Nog+FVkjUKeG4gVX+Ls=; b=bRT9DmCytUwXRpDtGoTds3HLK6B3uF11frldUEDT
	LfO6Nfek7yDpJ9nZxe/L5HJPsj8m09jNv6Y4HIxu+Ozsf1dnApWEIe6WFjDFCsqu
	iznZD9bZJCUUQmZfGQlgJHwfiLv1ghJr/Ou6ifG/5Js2yn2Y7feiBZ4WQIAVdIQD
	jr4f8Ca8jRRzxAtwfsbNJhMQWfJac+PeMheXMrjKj701ls+iGB8wUmAc7kPPV06p
	994KH9lBe6Mnqu5P2UzlrtyKKrz5OXCE/4v9Kf2JPaMkrNUcLrDgjQShbbsXTnjK
	alho0bsO4FaPR/D/Rb+/5XIpFQnOAsdugptkgOp2VJmxZQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1st1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:49:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-949b0d322fcso131495285a.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 01:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795168183; x=1795772983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Qobe5Koi0hqdQPSNyvly2xZNog+FVkjUKeG4gVX+Ls=;
        b=f2Uq1hnPi6UMSwFZ6zV8yv1uN4V7cktNZQUpg7Ma7DPo6jOMVIWHF2WPB9KVGDcPvc
         4JKSSw8ojq7FAAfERwPMLgE/GyvbseMKUR0cOYxQ6p8ouFKuDgwXj4AdurjBskFvC7j4
         NLPFvM/UTWlbLlYXNZWS9CtKdarD8xnV5qgIn2QBkO3U2C3HI797686KKjGxy2+vEVCb
         ImE3Agtx1TOE24xtRhTWT01c5zlsZnGgQstuaqOuvWyFFycT5zToSwbdCJSnPjdbHJHX
         l2o7hmHDnx8VczAEehzeQ3DrvqW18HVN1QFF9x+itcW5k0OadpOROM+TY8KvTABX8uWJ
         294w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168183; x=1795772983;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Qobe5Koi0hqdQPSNyvly2xZNog+FVkjUKeG4gVX+Ls=;
        b=YVFchgNwvsVw2/gbOCixM9XOXrNpebE4wfIbILO5sXbaXaQP8OsTBL+yr/YdQG+BSw
         JX7wx+766lMtEHVwZA4nH3t10/vpPqZglVV26BJGPPtolL1CjWSaPMi0/zX197gZvjSu
         yCDtMnzMeVhvyglEEoDBYTZs18aDhNzSPYQFcqbtRU0DPnU38kHM5YpGy7se4Cu3diSn
         jq6tKUeYcz1g4WxzE0hIP4nF7/ecTNJ9PeTJPSBI6l5PRylg/L6JHgGFXO1I/PQsIxPa
         95tjz8r+rIZltqit0UkGrdtDhrAuvpvHsRD/kuiVm066HzlVhXxvLjw15mlRd7hWygHZ
         6sDg==
X-Forwarded-Encrypted: i=1; AL+hErHptrJUBmG1QBcJ6DIKGjfyK6ccWn2lBThHS++3WE+VFVgNSbKiQ0aM6Ecm6seRIPQ7rKux9m8W8dlU@vger.kernel.org
X-Gm-Message-State: APuU4Z/kHr4k2quxWP6lDb4NniroSFSVhMtnacka0GJEZzH5I9urciT/
	7BD3+tAlXpYH3SqWzTyj2jUvf8xQlO7Wnl3BkCk4Gt5oT274nYrZJoUb+p4av4HZysrFSO7y9a/
	lzQMfELSgS8iqkFV33iLX/PAKpRWKGUQR2AThrWDrH5+hKFy3IEDgk6f49kWS+axp
X-Gm-Gg: AYBFou2V6GY2iJtzYckxmFOb6a0viWOyPtwyy6J0BmBSn7fHu1jjCqgN0Og8Oyi35yy
	gxnNr9fcC32VbnhkDy7gjPjWf9EGz0fDtcCmn02Oahek1d+ri8IF473AcIjEyIX+nty89uyaehB
	QKt8GMxUw8jkhdUStSXhKqLQ0IXoKFE0EaTHcNjxCFU68xhpe6vUfbFKp1DUjmFxZMmo/dmJERN
	D4oRFZm51P2iV2vlW2dBtAMjokzieJhLCDH+asd/pNjZgIlZQBYKz2hoDGohs5bAEfSbklsKwBG
	hNFNwHCEId92/pqSHBZP9ZbUUuy5oYJcm4QivlkOrv/rEKMyZ15Q3aOKga1RWPA8ziqEmDEco6L
	0j9aol3zivYHMx6QNIJrbADs/WE9mdhUUXiqSUJGyxc/3XaEIGbWAKlKNcFE5nK2v
X-Received: by 2002:a05:620a:4388:b0:946:6:129d with SMTP id af79cd13be357-949ba9e8dfbmr404460085a.54.1795168182637;
        Fri, 20 Nov 2026 01:49:42 -0800 (PST)
X-Received: by 2002:a05:620a:4388:b0:946:6:129d with SMTP id af79cd13be357-949ba9e8dfbmr404457485a.54.1795168181963;
        Fri, 20 Nov 2026 01:49:41 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm4443810f8f.50.2026.11.20.01.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:49:41 -0800 (PST)
Date: Fri, 20 Nov 2026 11:49:39 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: nord: Describe the GPU CX SMMU
 aperture
Message-ID: <zdolt2jlnv4gg36pjbtcaxseqbcui7f7pemmoo3ixlyk3ivcvi@qxkutu3vxbnv>
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
 <20261118-adreno-scm-fallback-v1-5-e99cdbf3121d@oss.qualcomm.com>
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
In-Reply-To: <20261118-adreno-scm-fallback-v1-5-e99cdbf3121d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b0017b7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=G6VyOm33As555aFvO9IA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: iSP3vc0T9wpZj5Q_crPTmBh0UHZQYlwL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzOCBTYWx0ZWRfXz2holcUeJd3b
 LYd1F+Uw8jvTTwawMld6pl8hTaYneg856CQv27DmL5phgdeV7sor1dXk8NmFGVCMY3qpB6MhA2W
 aGSSwjLZbekRJqMwjfcjv7MHECBC7SlLyw3469eFrlSLH223pE1KkbhWKXMUTBZwu/wM61+wOAs
 +939cxTvQFxL7ceRydkPkYRgmRYpUcITD8PKuLGCJukjd76PCR38yfOoB4dx+cGebnhS4KduAaD
 DmYbjmEAm60cYmrFCtkA8CJeOLJaCklfjeUjnJ2+rzE5Vf51noMbrW0mGu9A2eyzgz8rZasj/oR
 sMzc8uK+FBZAwwozwTLgjh58OeOLoJsFrK14/nyUdHRh5r8iB8iEwCCa4zyuSN0J/4hRUAVkJfz
 PIpgpg/pvuvmjajpvxTIQe9PwcZ6zvNlKvFcYLDvcc9SedAhQ2JeW3iCRiUaAnZLg/B6LkHS5e1
 PoZXgsNfkPaWth29BdA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzOCBTYWx0ZWRfX87taShdBYjEp
 6aFaXCpwy4+/OzRhNpPTVWtKjB0X4Ra1K6tdTWMuuKV/joFkljfLg4Ute5trDMYBTQGiZk/0LUF
 l1p/DnNCenAsQCoiJNEqJpq88aKuqOk=
X-Proofpoint-ORIG-GUID: iSP3vc0T9wpZj5Q_crPTmBh0UHZQYlwL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200038

On 26-11-18 18:38:29, Puranam V G Tejaswi wrote:
> Add the CX SMMU aperture register region to the A753 GPU node.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
