Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672BF30595B
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777285041; cv=none; b=YHDKFzsfN7izoCHcnmisIxc/GnVapib/SdLFDiEm0C0w0E6OlMbxFsjbw0mYq6WZdt8K20AWqq7bnNtH3+pR0l5NYXZYGe7QWIzJqTwAteuozHLV0gpyIsbIy+CivX8vAQlCpXt9/3h3mACDhNIQfFU3FajGZ9zId3AWvxCl0fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777285041; c=relaxed/simple;
	bh=Q6DHCzGkdSzX0wIKldnuO5g87VInOlN9REDr9sMqMio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=csuzT+/W8aJUzOO7/ZIUm4QMpccDOjEYxjG86onkzCBG0uBReX0NF4Y/RnZOxsNygECz07DRBS8XtlGFPgqKHrbFt2eR6r2ABFX4d7aCnQAId5O7aDd28fWuD7wsk6ZTEu/7iwRBQ3xgW0qa/7N0YrrMCtYLoc5NAfVM9ObFwj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AcOj40Pr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AMa3bpmU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AcOj40Pr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AMa3bpmU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RA3rTF3123751
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QOeJR9MMb+CCifJaiTThlosrl9cY53ZcGTmCOcTAUtA=; b=AcOj40Prb/ScOhGn
	xuuTN1IHDgjv4nsIiw5Zh3mVFvlFPPStymvMvMWqZZvJMqwsXPJOQRUqvGdM4b+C
	NdrfoR4OaZwLixJDP2QjmoroibY8eAyykJcXPYYeioawg+sm8fisLemFQEL2+N6F
	8aDukehpp713RVmH4BAlGfOtpxOk0/4e73PvLVczaffCwHCEdEm6F4IPzdmka6yF
	96ENbUkYGLiQ+qcqz1m0YjBEpgjFjlAFtskM4TgGNcqnCj8UzdvKBK74A7vfeSrZ
	WjKUpGjyY93xYIUufzjUc5w0rerMnZHLzgTLkPZX0Hzq49b2n/2F0vHHfuRmR+u5
	B0E6vg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5qgg1xp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:17:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35fb969a4c0so10974386a91.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 03:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777285039; x=1777889839; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QOeJR9MMb+CCifJaiTThlosrl9cY53ZcGTmCOcTAUtA=;
        b=AMa3bpmUDTCdqevtQFvY5NaodzhTs0GUGe6kpOv88pOXReZwpPajqvZjyJHn7NO0/w
         qUyBEixydJ1rbSIw38TZl7JxnIY1OA44tSoZinA9EFMpYZp1VR9hlhBNph9j3kkQ/nqm
         jT33cbB8Fr6eqfCoNtGBfqfex5nbIztcXZsU8DSAIU6ByQ3iBXF/1o/CJy3R82YrqdUf
         2NWWXezLL1Bot5JvV3dqm44IPwFSeqX/ww4yt/uDfiW8YUCz2yiyl6B2RaPpHmIUvVrt
         a6LXEAb13ewPZVFoC2A00V0vPCTceJPhLwGGSH0GTz9WsPnHLYQxxBtgfGivA5tE5vdF
         vbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777285039; x=1777889839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QOeJR9MMb+CCifJaiTThlosrl9cY53ZcGTmCOcTAUtA=;
        b=oF/94160dDzfPJpnSaUQbWIII9g/2c0BtWUwaASXrTXc0U0DNoYQDcoYtw22h32rzI
         TDqXsaA7rjgHmYu1wJEeBQhzFldRKBGZ+gKkmR5ry6lmWkhKatfaFV3SU/06GXP2dw5N
         DRJuRzoxHEZjbT421/6DDwnFLmEE79IKBFho+tNbnNiNxpv4mV/0lzwHLQrO2ipcw1jW
         Xd+0JlMl2aoh9dFZjiJNRwRawKQF2hkU6JDPsBQoh+Rvt4Ob4uoFn6YIqry6qYsal6LR
         caew3y446fF8sil/qaFDqY3qqJ9Q4TOCbK35e0c/7tZrjzx2tb4Lc8dCLso+6ih4Tu7w
         MaJw==
X-Forwarded-Encrypted: i=1; AFNElJ8W3sD5jbm+GVCRBasgi8/PG6AwpYizXIuAuvz8p7dsBLqwInQkdXqxV+s1SfcOjHCr4T9rcCvUsROp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1L33Si/am3zWF7Mfvda+a1TSSbARLAU8gRutlH95tEE3jPgCb
	qfkt1M+31p85pSadnoD+FE+/kBFrRCQU49qok4vcuprU1uszcSSphJSb0p9QfT1y+dhvzMk0sQK
	qaxoKYfmlJT73U0MxAXYFT1hoxP1hedC1tkNhflrCzkElDRBSCXrO/hWuNLKiR2fY
X-Gm-Gg: AeBDiett3mRzdgU/sfHvwVbnjfk5q2vLwmns2Y9VzWDv/CoP95iNdGHjYBnEkrjQ7h8
	dzFYULIzpgXz4aoIP+0wP2Stdhzvg1pAgVO0OGoHb3UwyZgxJEcHwY4IH9Xs23YiN25nWLWDNPN
	4hzQ9TRiEnzY1yN5KBXc+4x/IirSQQkJEqVLcAq/N8JoDARuV1Ot8REAyQKz0ZUqMzs2o/X3c3m
	no2vwb+Aw9LbAVu7b2FGGrTaLM8yq2MSKB2AJkI8ETWTWDMCznJIaSEq3PYSEQpItim37AqEU7y
	54cZCn+nb8PbIzlvTpLqHq+scJx82teJyzVdx4ghZbOSaTFR0kaCZvTaaoKk2nxgOSMAAEkGKXx
	DTWrFZeJtcVMr6kNwVf0uZF5PANF6gCNoHDwQoCGbizfW2hSdScKns6Z5MhqfCW9Cs6rYWg915v
	MCVMMyot2cS/xdNC7PzKr0
X-Received: by 2002:a17:90a:102:b0:35f:b940:4e81 with SMTP id 98e67ed59e1d1-3614046f98emr27402487a91.16.1777285039127;
        Mon, 27 Apr 2026 03:17:19 -0700 (PDT)
X-Received: by 2002:a17:90a:102:b0:35f:b940:4e81 with SMTP id 98e67ed59e1d1-3614046f98emr27402467a91.16.1777285038629;
        Mon, 27 Apr 2026 03:17:18 -0700 (PDT)
Received: from [10.133.33.62] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614371a7c8sm31332266a91.5.2026.04.27.03.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 03:17:18 -0700 (PDT)
Message-ID: <c51bf07a-c8d6-4790-9183-5863bb8e18ab@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 18:17:14 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco: fix wrong connection for the
 replicator
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260427-fix-monaco-coresight-dt-v1-1-1707017f20c5@oss.qualcomm.com>
 <97c230b5-167c-41d4-9f36-e62b97ff202d@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <97c230b5-167c-41d4-9f36-e62b97ff202d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwOSBTYWx0ZWRfX1cW3maNzmWYS
 o8AbQ/9kMPPBK9RHVVEHiZeE2uih08o6WAWgkhnD+TRdOoko88fjIacg4fW+IY2DFGHY8SYN3KX
 B4yzVZvtsMlB65xtHXIQYPHq/fAHVrGth3qAE4+oaBolhpupkdtcHnY0lPD6l89bAnbeWvbRedE
 mX8Lk5/NrKTwTlmBoxccm2M6xXg4l+6VOPASJ3dsTwqVkzfu5lv11ucv2qBaX7PUxw7dDjUr8rl
 gf/rcSsHCC8fWnKo7fY1ZTfgahWdbcmH7HUaihXucdGhl20XYm8YvlyS1JsLTtcCAd4nr08S8AU
 JXWpWi0IofBP/DlYCB7P8NFMXNKVRbC07EOGwfR4ySDYPK/m6YYmk+BD7FAxAGFLSERwDtAQGXI
 vC+KqgPNJXNTXwv+GPzc8iEW9mVih+/Xbmmp3OiczX6oJXw2G58RRTcSY+I1vi7O/UWWWtcTTo6
 oXnq5E+XweDUY971Ogg==
X-Authority-Analysis: v=2.4 cv=V69NF+ni c=1 sm=1 tr=0 ts=69ef37af cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=YAJqMnTD8kXav3sB2ksA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: ameyQ1fcsVsjikPx8zWONfVVZUPHxUZv
X-Proofpoint-ORIG-GUID: ameyQ1fcsVsjikPx8zWONfVVZUPHxUZv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270109



On 4/27/2026 6:09 PM, Konrad Dybcio wrote:
> On 4/27/26 6:33 AM, Jie Gan wrote:
>> Fix the wrong connection for the qdss replicator device.
>>
>> Fixes: 0f43254763b3 ("arm64: dts: qcom: qcs8300: Add coresight nodes")
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
> 
> I'm afraid this patch will miss-apply since the visible context is not
> very telling.
> 
> Try setting `git config diff.context 20` (you can revert to the previous/
> default value later because usually the default is reasonable)

Will send a new patch to address it. I just re-checked the patch, the 
Fixes tag is wrong and I will update it in next version.

Thanks,
Jie

> 
> Konrad

