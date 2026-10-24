Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873573;
	b=Q/vvz3QoUBbmVxrpGWy7E8Z9qjnlmHErPvDWYGRisXJKVlaq4CcgWXOnnMzT0pUvvltB
	 MCeOfkwOXM6Byfj26irnR2jEEgCQy0b/tfFf8MYqCYV5Pz0A5VBzHs0xhxil/TbR9OUWy
	 rRPjvDZWTIgoT1YEnm/gMKLgnhUpBDLpcP33POXD0zCfYkMAaGxAcwAkFrdTMVepMZrNN
	 sXw5xBEsJ/7eB9wim7Rjm1nsBRYFcZcE0AjymHprUXw2CxfpEMAJrO3kcZWMDns50hfIl
	 Fd9/+jWSZ0u48f7w4j4NoxIuox5/xqp0o7Al7wv+xeAYa0ymi9g9LzjTwKyQ61bblgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873573;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tD8TUcG4GR/qMQpgQaXa/j5++8tEfZOt1fk2tK6yt1o=;
	b=LQKzak/xnRX5Slch/AKmgqIIbCw4qRo5vECi0+0GylT5rBFadKQxHTiTjZ9JKPTLoKhF
	 p2lKydOJi8jh04MJZQAMJr7ecJqZT4yT4nbhpRxulJfUktOqLb0ehB2/wR8lhk9z8Ud8e
	 t7iTsfUpRv+JXyt+cEiL9L5+kVYICTzynWd3qoOmzHV2UP5wR8yCHu7UKHA5SVYVSolo7
	 U9hUeDYMF5d4UcrMZ4CYDlyRBYPUeePhxI1llUJO5dlp9FfqziQm1WBSn30Ua8hcVLxJn
	 JT5jdXTk6DTrCKmHXOeySqjTEwY98BhjqXGN3CeyHIQdtLtRU+8ffCStCk6nmMmfZlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="gbCNO/iS";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kH3O6Utd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B67606A31B
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22B67606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gbCNO/iS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kH3O6Utd
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OIU4qt2794915
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tD8TUcG4GR/qMQpgQaXa/j5+
	+8tEfZOt1fk2tK6yt1o=; b=gbCNO/iSifPPAA1bZMXy+FxG+TyfrVZvEifi5XNe
	pSRt9fe0PmAnw7LT2yhPoDDegDsBZhCQQhB87qk3PtZWQVORxk2tLOzDeGj/jzgj
	QHnJxA4OUOaGEz9lgSFRMh2lgdZYsByfgpllFNlj8spCC+O30x595a6aXZqrTOti
	FJNPC2ZAegCZnHzcm8E90LmFcVugJ6XCLzyAuSQ4gIwaSzpu7WzeauNk/yByK8du
	o8Nd85KVbmoDhjeWY2J9SmxhglkmDhFz1jnlU+LAFkhP5tpEq40192vkGnr9kP0o
	vgFuvGFg3p8Tibs39uZ7YuO024Lp8PwTwCOaG5W2gVItbQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkp6huyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:26:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f37c94ceeso612225285a.1
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 13:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792873571; x=1793478371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tD8TUcG4GR/qMQpgQaXa/j5++8tEfZOt1fk2tK6yt1o=;
        b=kH3O6UtdSQKmXhtvjc+zI3x4nWj9Akwxj7hw1WVhCoE+hhCyOWawMSNqGYDY6idKW4
         BY6VlFZpJkS8aR5lAluc8QCSwawSIWcbBZQugQY07Vq35HKfZWpj/G+RpYJlXaeHdp7J
         MIPbTswPTtnO5gUSNQKLQWXQbKthPN3c2LrdKncgGq85nkr9dpDC8scYEgMJ8WZ3X1Bg
         ua4Hs9/d//4kGGkgLDNM6EgYVtxi9koqYyi+iKPg8nsQxy9t9Ze30eiHRDJadXTH/1iT
         UNyTwBYt3TjRq/ELkM2lNRZI24Mq+gIy92ozaQMdUcWYNcLKDm3+/q30xUU4oGmvxiHg
         NdUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873571; x=1793478371;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tD8TUcG4GR/qMQpgQaXa/j5++8tEfZOt1fk2tK6yt1o=;
        b=UwlFWCSPBvHHW4O9mg+F3+EWWbGpH3b1ArmLe8TRKwGLsxx9osfttQAisuYlJNTPMz
         bMHVnHd9LqnHkOCHGKocV/jYpqkmcW+8dP6whrpeyw41dRHsygoGqhvp58vJxbY99p/3
         EmnCQq+vt525PJiWNPtFneAk1sg2MVTHVnPCqM4H+gcnZb1YakKUWG/bWMlpQnptqN1F
         7koi57DnNakTdyuwrN1VawQQpJg/kP4zBUtB5FDuTIEzR+xrgVuig6Tfgka7mbzNdCRy
         rAAswXBjZftybMvp85p+6BeXmP5VhD8cxlyH9PpzCjT3iCs/UmV85W/2K/F03HIUIe0d
         aOhQ==
X-Forwarded-Encrypted: i=1; AKwUvByaGNlh7YMLtCrOfAR2U8zKM+RqvmkPZrY0wfZuamR5s3IO6eIqHhaup+GO/QRGbp3FMC92J18FBmRD@vger.kernel.org
X-Gm-Message-State: AFq9FYK/3Gxnk3/cciKv5fE85DCwSEx7166nwVP5jobLCixSz+uxsDKO
	I7z2SAPA1FvUnCitwFh0AvPwjWn7W7NktZa/Tq4e1R1yy04y+hCNy6a9KlUp6Mw6mfPokewk6so
	SrugKS2He3tK1SAyr73l4bAuaTA/duo8zAthuXt+Af5net71i7q4WzFH9/L6WbTeK
X-Gm-Gg: AYBFou1VZE8wJ4w3PRrH9IU/Jy/FE4rh60w/3klGz1RV6K+TDn6/uvELWqDvaebpThq
	GFOOSsoBXaNV+ReIa/HZqex36CY5v4mHk/xyhWuPhkS5EMDVZYvq09Ycr1WurM9zhCnPZcFu370
	z4cCowhAUCaxBYZ9neQUF+nBdlXdGFkGaatZBCqDPwpCvAcXeS7uGnFfnG4jp9/jUXeLvrFUQzZ
	hG69i4jYpX5Vn5hH5S+FguzO0A+fiqGqglgehPLDlQ8LuSltgNnAA2XgYikK0PKxfZzQYmyK4mq
	XDE2cyJXdENDf3B0OnGxHz4yOL0bsZnIZuuPYYgoyIzBA2+r0wb7+AMGSeBb/WxW37lGd3rbCH6
	VydwYMpaxib48Li5J
X-Received: by 2002:a05:620a:261e:b0:93e:fcac:a91f with SMTP id af79cd13be357-940ef9d656bmr390596885a.37.1792873571393;
        Sat, 24 Oct 2026 13:26:11 -0700 (PDT)
X-Received: by 2002:a05:620a:261e:b0:93e:fcac:a91f with SMTP id af79cd13be357-940ef9d656bmr390594685a.37.1792873570855;
        Sat, 24 Oct 2026 13:26:10 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a06da5fsm50379965e9.3.2026.10.24.13.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:26:10 -0700 (PDT)
Date: Sat, 24 Oct 2026 23:26:08 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sm8650-hdk: add DisplayPort audio
 playback support
Message-ID: <5ijmn2ozihmobfliynovxqo3xiss4u7wdmt3tywdi3tybzdf6g@ta5ymqfkmvec>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-4-8a189c71938c@linaro.org>
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
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-4-8a189c71938c@linaro.org>
X-Proofpoint-ORIG-GUID: fQdxpD5NgZBsVfyUbTgZ69CUmvcPhAcr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX9mHS4TMj3ZTQ
 nbVQI3Io9KhgeNfZcAcVY0ungkxijPIDRm1Q7iH+vp2ECIR7VMMFmw74AwxAZNXU1ihqoYIcNFV
 1c39yVNJT6HbLDkjsgQGn++3jjDL9IA=
X-Proofpoint-GUID: fQdxpD5NgZBsVfyUbTgZ69CUmvcPhAcr
X-Authority-Analysis: v=2.4 cv=bq/Zl0ai c=1 sm=1 tr=0 ts=6add1464 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=lwKPvcPLtPgdvEeQYCQA:9 a=CjuIK1q_8ugA:10
 a=3Q3lADbaBCgA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfXwfDURjPfT4Tr
 HH5Y3K6I3O9FnnnkFb9h5j6EOyPa8vzeAiNrJPuv7ldA6Gx/yb3vpkUFwRe4G2TItASKeTGx8Qd
 saLj2yvAvK+5qWa23YtLLUCGENkniREo2P2f7iiEW8FyX4C0AbgGYhOCydul3UsleMwaTJ319Uo
 Q+9oJrYM0LvH5v9bptrr7f7/89H9o0GwM8iyYwPBKNvU52tITSi5ll/egqAlBfcfXDiWsWYsJEC
 bMqur1GgnULwz/4/+9FKzL5QMBFOzg5lqcqCfnPTJKZJh781HZjKqVnUC5kvxDOyN6R9nF3iTGi
 RQN9hVc9noRTwWIAqsuiZsPU+VMZtec6FXEEfXvsdb1EL2uPyQd+T+M+XSgZYzzaWqIto/Zlim4
 jykGgffHmpuHMGOtW7HWhDSx9miDMA0BDNSYznx3agdJe4EwsCtLPTYiPIGqKPphgvODiehNq3s
 VzCzHv5zrSE9/1skrdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610240081

On 26-10-22 11:36:24, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the
> DisplayPort altmode output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
