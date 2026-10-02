Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B84F474263
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934472; cv=none; b=t+QrbcuacMko7oAG59oKfgbwjMdZm6WuML9Co2ecrrocptLd4JHC4lPaW/dMuUDwJU9Na0OMarZ3g77Xk+zwYCeZaUSTDHNBMAhq/o1l5E2mX0+kA659Ud4UJ03QZvoj/Mom9bq7/UjbB4vQzrJ909tyu09WY6KYWeRGZvymWOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934472; c=relaxed/simple;
	bh=9NFwvwjdEu6EpliaWOFU74+LC/R7K/xtZBjcetkEVj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPWT+GlMUbb3+TLkj5HzrZ7VjzIRniy23BasH9keHy3nyG2xk8fF5KF88sJr23TTh8wl7p4nDTGivrZ4HgzwR3GdEIQwkt+qw2AUYh4AKJQ23nnBd5BPTOmsgc2eawf3svsQxC0iWWGih8AZKLUl+1MqVAu8HhD7hH3A2f7ARuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IdpC91Pi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WgSKzqnn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IdpC91Pi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WgSKzqnn"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925jIaq1543491
	for <devicetree@vger.kernel.org>; Fri, 2 Oct 2026 09:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RDxr7B1Xhs8FyRPO5MY0yhhg
	tVLuT6+k7rHf1WY5blA=; b=IdpC91Pi+1XRPC/UQEnhaP9ZlLBx9/Yi68IbBpsg
	wXIKTgCGwAG21e8eM9FAKfQxRk70YM0znhUEjkyOXKREFh2iTqa6iCvn7cLankep
	SDjaOJVHI2i6DIvEL5723icvkJx3QEPrAs6Q/CVw9ABBZpUIOjuDeS8BeATgch70
	cKEFS1nHh2Db0AnjP9oqOAtTeX2xqaBCUBT2On5h2TgSJLyFM1zm/z0TEj6Cz0ik
	hRL15kLJGkuC+XixWOF+UWbyjo2TnxaRhxARBeUgrugo0tgZPewv7rS+oDeeSA53
	wTHTqxoMi+sgnWRRJO0RRVichFoGPyCuiguEVoLdjKyn7w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h256mryxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 09:47:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so1826168585a.2
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 02:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790934469; x=1791539269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RDxr7B1Xhs8FyRPO5MY0yhhgtVLuT6+k7rHf1WY5blA=;
        b=WgSKzqnnzkD+pnytanzTTXXE+HgZ8L6sNFx11p9Z+JiIQdAfiZ7IeOUOa1wJD9u/T6
         p9gzQO39M0OE+V/jiUMOv32LhhedU63sy7fLPEVFf6CAoafDSbhZVQ+70gYdkDU1i9En
         StY2nDXvv/8s8JjcNinRWJUK75zdWjCiAOQkftqzla05WQtindLI+iYJqdShgzcXDz1t
         PXFGkCWRMR3ILG6wiGcGG3zUc5OUt8FHaDp0icjZf7GarPG3PTGQquVRIGAvoNuZfpcL
         5iBcK1jml2enU98/rPyso9Olfgjc/aqkJSGi/YCaQCZ7iooeBVqfI0XPw0zdMcIth2lr
         /w/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934469; x=1791539269;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RDxr7B1Xhs8FyRPO5MY0yhhgtVLuT6+k7rHf1WY5blA=;
        b=U3kZ195IngzocdB4coxnBsbodLAuOGCgkWFNhU7b5oiHPmgAihl6U+/pSYNCBdyOLQ
         jw1PmaNGeZwu/xKoF1pY+e89z/dKHdsvG38kuo0pP/sGTGJI9qbmCMDQb6+zaGPuPNh4
         PSytaOYqOylUFaauM4n6Abz9aUIDI24oEQdaNyTs7hwQJHBX0CcJcxNmqSL9UADuRhpi
         ETXjXwLGu7H4jkkuK2DE2gaUV3N7F80RYJD7b072TBO3QrSYbRs6uGGGFXJc+kIsEgSX
         QN5Tcj4rKbS0vJv9zDzCMiwLVlaZ67Kj5TlJySUtf3IsnbNH0rhz+QMQvoDr66wnz5Yo
         F6qA==
X-Forwarded-Encrypted: i=1; AKwUvBwCV/UrU7RDEGjEFmxJIabBkDBd1R/JXXtldSjdqPqYxBh0GxLysL6Hp8hQex2mDViRAyOjWtuiYyj3@vger.kernel.org
X-Gm-Message-State: AFuF++n3GXC1f8jM2UewM6TVLUVC1hRL9AwUHusn575bCMUteq02fk7H
	WGpk9mbgkJZeL8EUh1zPX8iJA5cscyVDRYNEbcVsnbYYA/O4Bf8/qHIYI2C/gufcCBD3VPH+aRQ
	ZHKsy/udbCyrZPdwH/66r3VZQQNPfVPHPbMITSjxcMbNN+TZuNI+D9KEYCW4Irqk1
X-Gm-Gg: AYBFou38Z+k+gYsOLwuV5nZPYLl480v9MBBTR/hGc7Gq56kAPq6a1/pGdG1+u9e8RsX
	K57V6ORC/WsFyfAGP3V9nqtFLV2qyZK3HYlcOcpYuKsGhQpONscnx/Pph6Lj804lQRvSXgVEmrg
	cWCRauh/hG5LJlDfoYTpTgtJMd5hLmKH1Nz+zx7oKZXGE5JqwUkShB19R66o3RaICfGI+LvflLg
	V9Q+K+iDdiXUzmTnM5IoDdMi/YqGMLuw9YaHqFpC/kJU/5+1fG4g6VarlZ2Cs4HqU9TxjlewEu8
	y8EE/8rNMWU+otvKvG5SuuWQ2H7LxKK/rX9BlH+O2QVpR95NvES8V1jAQsw27TquZmGspHrI4hP
	6IzmRAjemHD+nwp8=
X-Received: by 2002:a05:620a:27ce:b0:93b:d7a1:ba11 with SMTP id af79cd13be357-93cf18bff37mr336081985a.60.1790934469348;
        Fri, 02 Oct 2026 02:47:49 -0700 (PDT)
X-Received: by 2002:a05:620a:27ce:b0:93b:d7a1:ba11 with SMTP id af79cd13be357-93cf18bff37mr336077485a.60.1790934468708;
        Fri, 02 Oct 2026 02:47:48 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104f89sm5011766f8f.30.2026.10.02.02.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:47:48 -0700 (PDT)
Date: Fri, 2 Oct 2026 12:47:46 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8650-valve-deckard: enable the
 watchdog
Message-ID: <d3s2tbf2w27kf257xxtw72ofpwtnl5wqxajzsgw2kbgc375iti@3hqht33dtekb>
References: <20261002-topic-sm8650-deckard-watchdog-v1-0-7d7f7d71d88a@linaro.org>
 <20261002-topic-sm8650-deckard-watchdog-v1-3-7d7f7d71d88a@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-topic-sm8650-deckard-watchdog-v1-3-7d7f7d71d88a@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzOCBTYWx0ZWRfX/THFQsJ5drQ8
 Q5/EtNvDj0w4272YQVV8XCQDZ3ZehijUtFGsnvCzn1L/3M7u4eG6/l13wX4uZJTam+DG05U51B3
 fIRMRgRrWY6mDHF7/IqATpeUy/g4dYw=
X-Proofpoint-ORIG-GUID: 2JEjCDc5qil0ziHRXE36JxGV3XqMkc2G
X-Authority-Analysis: v=2.4 cv=b80ncdGx c=1 sm=1 tr=0 ts=6abf7dc6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3WhsykZCFRSWcWe-wlIA:9 a=CjuIK1q_8ugA:10
 a=3Q3lADbaBCgA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 2JEjCDc5qil0ziHRXE36JxGV3XqMkc2G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzOCBTYWx0ZWRfX6bxxwBJCU3TO
 NJHIQGlZ7P02i5EzH1+2Eri2lwhyoKzruchEEm/tes1JPhd+a+ZDudK4BeKPYg1B0/ViGjjc06w
 /Dq9sjo6Y/XVnNs4Jn/Ou9cGxZnlLz1dfOaz/ra8YO4/Sw4vQYqQplXfDP04o9ZKaJDxWofeRio
 jkywa0xbQd2dK/8JQimkaaad/MYNaNJiZsgVi7DQMkewYfxzw8vPejoxhgNDq0e+nHD5A2VJWlY
 3m88Gl0r6E8SM36REzYrIXoARVJMmT6HyNA4c0fKTai22Jq6OOO9sXaCKMgtCxJ7ZqpO1/wR0Ha
 FD5j2uVunNNepipB+8qPI3UGcdZbUn5uyZtBPPgSZvJJqyjDa9Umx1rjxon1Pfm5W/A8O1zZBJ2
 HmbFlErieCGBGSeAZuXAhMAGNAv4P5rqYiHGU26GiYCgwUxsCQtCv0jYa69XmWtiZ1SYmYunfOf
 hnymx43gONIw3iG9nXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020038

On 26-10-02 11:45:30, Neil Armstrong wrote:
> Since Linux is loaded in EL2 on the Deckard platform, the
> watchdog is usable by the operating system and can be enabled.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
