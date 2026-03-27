Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A64936C5B6
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 23:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654515; cv=none; b=nGik12ueHYDpzVagmjf4zxds3aoEmhfTCAMzAFL3ewj11ScibhydbaREGmu5fDhDRqmiRBqZmMyuQ2zLQsYOECy9LfrGsEUZuj+/T1vG8os3MqjWN3+lLY0kqOTjZL2lY0rg9q/4NL68rskN8Y7QS3NNy8J33Hyj8mDIgB/J0Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654515; c=relaxed/simple;
	bh=z748r3JzrVNcsOu1XXk4TCfZv2PoDzts40hEbJPK77w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ThDiQcLRE5CmA+76CWa3pHhh4BlqhCW4csAhqYT+F5sIZHD2jopULK0jPs7NshF7Ikh/gGt1gRfnupWLBsgyl84ApclhbGyvBemm1jIkkxg/RPnkDLrLk2fQrVAmBH26lTvVNjtSzWivaDJK90KSE2hDemxa5epTxzAS7N8HoAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dltQ9cF6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VwokLV6K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dltQ9cF6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VwokLV6K"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RN4ATw1650119
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 23:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rPftMcpJoQUSQ0b3mJGGeLW4
	TGnDrlPt2VGx8vuxkiM=; b=dltQ9cF6pdZ0qRad70nVujx1gR6I1sdRqPtUOuBZ
	7g3/nbK3/OSRuAhcHV1EBwm2t9/HzMLY4Nb5h1MpiiXN+YxCQJ5Khc9WK5woh4iB
	edWwmAeW5447VXkX/vSGUVgGtdMLK3LpdeodzV4C7/21s/YrEMECaO5gOYjBY6Cy
	zT+6jhOTQmvsWjM7bQNOuGcY+urXyNK/oZDe+GFljo5l3o6BrJ6uLAWWdAf6wxqU
	HrFCNHOBZDYhSDaiszJlUPplTSCvavGQC4t9At82LamQWizIWK3yrplHIkciUqGN
	pwSh/wkPONEdDIM0+Z5QAhQtX/UwYGPUGlftXXA3NOoReg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6111gcsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 23:35:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b52a2d70cso73469601cf.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 16:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774654513; x=1775259313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rPftMcpJoQUSQ0b3mJGGeLW4TGnDrlPt2VGx8vuxkiM=;
        b=VwokLV6KFhwiyyWSmGMF0eH8q27390GHeUDVKlbtFt+tluTPQtVZoO2HKlDOYQYqBV
         u2cw6PBpxxCw6XD2wdgV/1Ruq4vbmd6uBc3kc9BOjGIwzhMGd7i/RrfYdqybumVRfGFc
         rHY4oJrBXy1TcTXdyNcXuYbHGwgT2HTJqgfeZ5bRwwtJrRgG4Kl0WKYXkqxR9YLYpFAz
         sqHlj1YkDpweBdes79Y6vcHMjOlzW0Urk1uCSXCmEAWiu+VIU6bishMmqE5EUlq8bhk6
         3WzgUbdqotBV0yPFJatEdT7ikhSwLENlv78LPJP+q73GRIOk+LNPxErRE3FiIQR16sZn
         k+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774654513; x=1775259313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPftMcpJoQUSQ0b3mJGGeLW4TGnDrlPt2VGx8vuxkiM=;
        b=cJLiPdbD6KCstTho1TVBW/wM9CepaQZzBfg7JzODAyniuFKP40G+iYaXRaLtD1Yjr7
         avPYoLfoU/PNDdwNnr+LQd6dbHTBfvOLKqTwzPgMxM2Ax5nrPOlSuy/Z5ncOArRT3d3w
         MEl/CWsB7Q1QyAmQeuKCilAl0OdMNi9AnXV5t46BqscWI8dfZgh1MzPI2/6OeOnU4ht2
         PWAT/B2IviP9jf+ehZvdj1aGPIxVo7A6ZCavHCWwBrrhtnVKLxA1mxfcLTS3cToUdjXb
         EwRnfv4Rift+UJIf5LzKVnquIrLh/l8kQP2jFolhiNp8PRBIcc9w5uqoJav2pwLfXf4T
         smKg==
X-Forwarded-Encrypted: i=1; AJvYcCXfTrnXq8SCxtljHG4S6NGGYbrm64mtXKctB5465lmOjNP0tXIO4QAI8s1TVfZlT7BQbPJPSzdjktVI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx83x98bw0T2cKNYhlO3NVyCW/oxdsaX/H8JHY8R1O/+Wve0lyb
	Y2cna8ovgJiSEy/0PLDxyiSXrZ92945zpxCvHW7VNVNROVYGwuAU/NFLbEGulkSIOpGtQ3UVdzs
	BLOPBRZz+S8pjXmRu7WHTQV99C55jZDDbVNOLpmebgpx9SIcFabVbiaUFeVEQWYBA
X-Gm-Gg: ATEYQzwcN5elxe4FoBc+K4OUphOecfkTsFKjoAaG4MlmxtEpyuq9t6yAjPPbY+hZdnz
	yxtFd5w1Znga5Vzv4qrm8hvJuWoMVr1l/WvHBomHn71QPji5YRRjxOQqF27zfzPvBDMxbNut5vq
	xBxxhcBSR1tibExFmpr+U1Dm/nYhYswZZJoixR2TibOKI7GyTPksMo+xKlegY96BaSYfmec0q8n
	FP2AtdAM63Zu4xi0x1BYrOs9qmJNHT1euYgx8ITZwZejsDeysf93V+oIN/X5hMT8V8FyQ9Xjuxh
	n1y+DeB9y/QH1GYTriBFd8vFKyAYKQfJcIkRfvrn1caEYXKS3vod/a+suEvltvLysAw5LFybohq
	SRUffhraiV3P5Cg3R0Q8BzXMKEskQvx14IJiJ5sHDPk1QL+WCoH99FVQqiXn9j/xJSc2CJdBxyR
	CFh4g/yLopXrR1oilu2Nf8QVo3mD4sjxmUdmQ=
X-Received: by 2002:ac8:5d09:0:b0:509:1766:2f45 with SMTP id d75a77b69052e-50ba3976235mr57551821cf.51.1774654512919;
        Fri, 27 Mar 2026 16:35:12 -0700 (PDT)
X-Received: by 2002:ac8:5d09:0:b0:509:1766:2f45 with SMTP id d75a77b69052e-50ba3976235mr57551511cf.51.1774654512401;
        Fri, 27 Mar 2026 16:35:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b14603d0sm82344e87.83.2026.03.27.16.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 16:35:10 -0700 (PDT)
Date: Sat, 28 Mar 2026 01:35:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] arm64: dts: qcom: sdm845-google: Describe
 Wi-Fi/BT properly
Message-ID: <rpldxnt4ath3qmo4fch656gwn6unb26h2ptg3quckezkedsvo6@mtmmqnnxi2nv>
References: <20260327-wcn3990-pwrctl-sdm845-v1-0-3f5c34e3fdd0@ixit.cz>
 <20260327-wcn3990-pwrctl-sdm845-v1-1-3f5c34e3fdd0@ixit.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-wcn3990-pwrctl-sdm845-v1-1-3f5c34e3fdd0@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE2NSBTYWx0ZWRfX+cvT/+FwLzWS
 hyTY/ng5HCcAZcrqne5V/tLsXz2LnzhPjdZrN4d7ikXfgPB1toW+2eQ/CoJHTUOlgwRRPDzxhNx
 q0YUCJIyXozlOt6MAtmqBtSf2OAPS3W3I26ebjKC4YDkWOJ+70h8eWs7wd9WtyfdM4iZGDzzfs6
 VkP6tozkapFvcFoYdAAMR/YQiNbOo1ayWt+wmoklCSy/LIOmP+86Jb6ph2y/09IMfblgLbKjO7O
 LgP5h/AJ8ep8f+Fr+f4a5Soh01QTYeAUWoOpMRQHbOJqWA8faKlcqVDSoquLCUiogbbcwDe1giz
 hL/2BHloUiqdUtAFJ083V4zmOi2JZJEnlMbAZ3CF83KK+Y/J91A3Kfn+5um/xyl0+B6xl8M4qwe
 Cnz1jaeQSORTA5VWvOv5cFKsDuY+fOBfS278NxMgu2hlCeTL4LIZKIZRpLgh5SuDvAYrpweUD77
 6aLopSzA2fe4cbo9aSA==
X-Proofpoint-ORIG-GUID: 3bfe1xdMX1U80Wz1uK4REUVDO3FXWK8A
X-Authority-Analysis: v=2.4 cv=aoW/yCZV c=1 sm=1 tr=0 ts=69c71431 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Cb6hrz4NNR8bXqT0X9gA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 3bfe1xdMX1U80Wz1uK4REUVDO3FXWK8A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_02,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270165

On Fri, Mar 27, 2026 at 02:07:08PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The onboard Wi-Fi / BT device, WCN3990, has a simple on-chip PMU, which
> further spreads generated voltage. Describe the PMU in the device tree
> and rewire Bluetooth and Wi-Fi supply properties to use the PMU LDO
> outputs instead of referencing the SoC regulators directly.
> 
> Couldn't verify the swctrl GPIO thus omitted.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 42 ++++++++++++++++++----
>  1 file changed, 35 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
