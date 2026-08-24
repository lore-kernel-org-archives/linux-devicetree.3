Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786AC3F1659
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562691; cv=none; b=kDvlPktzpn4fhwCYMlc4MnXMdqVfQSCX/nLjw4q6+In87BjjE9iPhsBvbwOmmn8xp12Q71vnECHSmlmunbDkWSKlF501FbXEAOvRXSKz/EN5kNbgWWWE77YAFNCKDp7+meofm/wcAtWfZHcPHZuK2iV996rxJv1u6qFz4tbEGE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562691; c=relaxed/simple;
	bh=ASDYRbcO3fDIINFD1FxD/tfq02EHISmLiz2DBh3Tn8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XNW4gW97f29+qasOMMRWp+IlELmBg67t2wgtp/Lvhre2BTM+Mu/aKL+OMyH5elrwpv2pisRLNBV29OpdM58DwLd+YAbh+0e6F+QR/LaJmau+K1a4hn3eRq9cS4rhVqgj7dt19K4EqHTNN76x2RjL+9H83D4Vp4ZxfPzTjBUn8jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q1V906Ey; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZTcxeZtx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q1V906Ey";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZTcxeZtx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O99EIZ1981809
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4CSP+u1YiO6b9Hgg5N9ovP9d+PWS5gNJELTe6vB7hag=; b=Q1V906Ey/iZ7xOK/
	IZtK1Rpr1FoRFyFAZgv8NoH+9eplv0h3V+D1J3TVkVQd7+jVXR4LH6O5TsIvleWC
	q/xL5ITJRtv9SwplxpLqZCXxMJUsnF47liTRN7KF4akVwOz/IaHJXgbCVuK2UPPn
	vKFQUxPx7rF6y5G6Gjp/QlbhMZb7JpRo9HVm+K/rXvwqdehBsQoGWYkUlz8DuUfH
	MXG03s3ddleY/ELjyTDR0zpTsAlGlRxveXGhYVBVI7W7K/hAgH/FKge6F4Le+T+U
	AWlaGiJtB43lN1IfkZjRVlG5NCoANhOSC2MQ4fmhYEXf4DBSvoIpfxcwCgIy2Erl
	jysEcw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g7528p64q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:11:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfa45b280so7855071cf.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 02:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787562689; x=1788167489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4CSP+u1YiO6b9Hgg5N9ovP9d+PWS5gNJELTe6vB7hag=;
        b=ZTcxeZtxYIcx2LWDgwPRTL9zZeFSy2o1AU4/x7abFaOeE81zPH0eHXzKirX5He6rf6
         FK8emuM47v1AhvuV0Qp4gK/kjvHDVOxzgDyNtPruGH3/VFqdK6bklYLdECl5JU1vTNR2
         nsMp5tUweMsJAFMFdR1Vlyuq5mWo8rsWVaejLILZPOpemtKX9EKN1+xtM2uxLxZvTy6z
         7EtaFsJsRaiFZf4h3pgKVst/ijTlUA/QTH4R/1O3XhYwjCUSbJRf+3Z2qnWb9F4POva5
         /oumkUuKHFF5HkKKyG5Aq4B8D7HZmCceT4LWYWTBq8Gi6D16kSFqRdqAFwx7SqLfFpsQ
         /2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787562689; x=1788167489;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4CSP+u1YiO6b9Hgg5N9ovP9d+PWS5gNJELTe6vB7hag=;
        b=I6qcW8zg7yDdgVm7TLJ6mqjWz+eyMMv44K0s3Pyhhzm4L4qgytUcTrjt/J3LBJZ9LS
         Ej+TgDNclrjpvl5pJo0Osg2W0lzoMoNz6/HhqUyP4uWZC9y16pgSSEQ6PAbxveNfP3oq
         byNDrjjfahiMPbpTA/ELT0Ive3Qd2fUZNFI09QeD0TX6N6yjYpi2n4BHqO5gj4VPbDTA
         CrA9apTNJNDwh5aCGm0dRyOYPvEmmrnjqna1L2N/s0ITfBQaEd1q5h32mapOGFyJTeyI
         xeL4jbzrH31rQK6iW6+y4g6N86aTLBrCS1V+NBxKf/ex37vZzR9wleDNYyspAT/nGsEy
         s/Hg==
X-Forwarded-Encrypted: i=1; AHgh+Rr79p0acrgRINT1YfC1dIWXCWgrPuY0jZ0zZQfrxANFjOpw89f1S6iwAbuIQMybJDoRYYOwPYcP48Lw@vger.kernel.org
X-Gm-Message-State: AFuF++nqdBAInPVNMlfW3y3C67Z/bI6FwWNPpoBudpLjwwDjDOx44tkK
	vh/DjsEpnLF+L67OaEIBgk7WT2UWnccTq33VlkUfuliwXw05QnrFL7MTz83PdBwFUQg83ThMM1v
	kbC2DpN3OcVQO24xUYDsWBNOY8OotgEguZf1ltdlLVFDvHjEKXH9G3CQCZjj6N0sW
X-Gm-Gg: AR+sD10nbGRY7yFrSvwQHD2JSq22eNXRTDXLK41M/BBKbiEY4gR/W11SxGZe2a7Njbq
	CBpZpheZevboleHeYxgsqpEiDn0DscB7T6vZPugGiHO4WFQvgUQpIsfTP3dqyis2x83CY+KWZW8
	/VHNrLk1S4h9FltHvbhTslhAgCSqdfiW7DhKJ1BNm2+53E9IhKZi4QSLUixmJQYUcIkNSS7OqYT
	++IhEx/kp/PtsUxF+yeigHJnAC4iOsaehB+cDTL6gwAfYqV4bNNu6O7s5HhxX+upcaJFQKsTGeH
	ESwbPPe/hUdswtQjVyFi7E/Epa2JqIdNFOwy4ouTzXykaNlyP2Hb+gHoqcyVPYGQ6+DRh5pVFo4
	maGlEs6Gieqo2v+2XyRzC1l3c
X-Received: by 2002:a05:622a:1489:b0:517:5d21:9899 with SMTP id d75a77b69052e-52df5c7b11bmr183849551cf.5.1787562688518;
        Mon, 24 Aug 2026 02:11:28 -0700 (PDT)
X-Received: by 2002:a05:622a:1489:b0:517:5d21:9899 with SMTP id d75a77b69052e-52df5c7b11bmr183849151cf.5.1787562688123;
        Mon, 24 Aug 2026 02:11:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24967459aesm1117153366b.48.2026.08.24.02.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:11:27 -0700 (PDT)
Message-ID: <c8710669-0952-4c4f-a04b-50a2e83e0e9e@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:11:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/13] pmdomain: qcom: rpmhpd: Add RMPh power domains
 for SM7250
To: Sreeshankar K <sreeshankar0910@gmail.com>, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, rafael@kernel.org,
        viresh.kumar@linaro.org, konradybcio@kernel.org, tglx@kernel.org,
        ulfh@kernel.org
Cc: bmasney@redhat.com, radu@rendec.net, abel.vesa@oss.qualcomm.com,
        lpieralisi@kernel.org, quic_tdas@quicinc.com, danila@mainlining.org,
        davidwronek@gmail.com, mani@kernel.org, robimarko@gmail.com,
        linux@gurudas.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260819152545.3934-1-sreeshankar0910@gmail.com>
 <20260819152545.3934-9-sreeshankar0910@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819152545.3934-9-sreeshankar0910@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DsJmPm/+ c=1 sm=1 tr=0 ts=6a8c0ac1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=T3cQ91Bvcxg1os4lQNMA:9 a=QEXdDO2ut3YA:10
 a=Z0LeWUw4VpMA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: vOT54nZ-QBpK8pnajbSOh7qxTDdhA_wh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfX0KUCsyn0XP74
 Dv7XR2LruGbO9hIWj/x/JkmqfS80hOtbAlNGubeLVV9dIJFSdYesFbb9w4Hf1t5cx6njoVgazPt
 Jemaln81Q7kIo0j5DAePW/rDlbq1ozMkMPbEpJglENNmkAe0ul4b12qaJXzwIP6k8nTmi2mbFdE
 jSYRCxv3xbaoIdAacYNRnTWrXBavc7I+IwCREqWIhMmXmsJFzGNBkRKGITpFU/lAAKIqUftOJhJ
 9vJsx6LSTWMteJTuj5fxB7wxHUAG+kyaeB+tUwnfPkSj90qf3vhRvg9HTBoeNveTvuWIEMb2COl
 MzSZzu+/X2/gMvMOCqOItJsd+EPlf/rtCoo8WqUXChEVxqPtTG/lnuvJp18mRbUfNOSZaOHdaU8
 c89z81qjufSnL7FmDRJepjzhtQVu9dAGWEYj6A4CwKyoSmrJm0LKajoviTZPP3Tgxa+wW4RFCbc
 P61ewrYOu7reiCD+aUQ==
X-Proofpoint-ORIG-GUID: vOT54nZ-QBpK8pnajbSOh7qxTDdhA_wh
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfXwQ5rmvafXukZ
 aAy2f9C4ASeXxsr27f0erO9WTas5ZoiVcUnt+MR/RIFBS0W8LAJNDYtSFETIRRG2gYK2S2W+Tlh
 LMDqlHUonQVR1drVfyL2/JKcHvJ8jQE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240079

On 8/19/26 5:25 PM, Sreeshankar K wrote:
> Add RMPh power domains for SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
