Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2E23F65EB
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 13:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787822; cv=none; b=eCstf3r6EoYmN9Leu6xlcVH2L4VaErIi8erbHXab5V8F5BZg58dm/Or513qNv0hK9b0u2qiiTnDFJjGvO8z8nvdxd2zlwPY+8lipkgLk7VVCY2X6Wf/XClQwt8tOgMNFUkge3uouaCbgJMD17nJ72RR3qR1iEKO3VdIxmQ5pkWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787822; c=relaxed/simple;
	bh=PSCZlzz5fjxTGq9uKR6wX0C/ymeqII0/PUc/wexBbHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BFV3qzmqUjQWdPjAq910xNG7O5dXQUyzw1p8v0rj7evhnqJ3r4B5NpSl2jvcgxYuVXa+APAtWN6Iu3DUP06IyXTQHjtQVRcHSeBTR4BERiBtMOBY0Ad3JnSeEIqnJYBo9p9ZE929Y9Ku5WzHuN6fzLfTB/Y7yVES8Tu75obRx5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AsXDiPjm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfXWJ7bM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AsXDiPjm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfXWJ7bM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ICrpOf1294811
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 13:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B7JX5X2XTD4Cde3MxSmPYTnPXo33idXZtjiWq+3lvLA=; b=AsXDiPjm/cJN4pZl
	RdSpC7JwGwSCoWCLzG/B6XJfdw0jsEwluMJtdPBCO7BR1CeHBLRRcJoOawvbkGtA
	PTlQQBA4OQ+s+Oe8uA8cu8Is57MrIYpst1KglQE8+j115BcqhHO9cxU9TtBCyTSg
	nN1qmb3ySMkYFpWPi5wd4yi/GdM7vRtbM4caAbqz4WsFuuDDiG4nafF+xTUdIwU5
	mrsrplcD53iSG49rxOW839guDzA1/hwZbNqtSJF115qQKjaNlVJeiuKP2MFd3dki
	SaxgB0FujY/xEYTQEuEQFkY2aUIT++WiiMREwRO/CwYAT+UKehbchoZ1F9Hefl1u
	jn8ASg==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0vm3g8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 13:03:41 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-43d2ec4bf4eso212687fac.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 06:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781787820; x=1782392620; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B7JX5X2XTD4Cde3MxSmPYTnPXo33idXZtjiWq+3lvLA=;
        b=dfXWJ7bMgUbJcldIz3vq07I74EpPN2vmTdmK7m/GTtcLvhsPQJ+TLE0C/FTxG78pC6
         9sTmQAh9pUctk2vxWuomYl5g0RuhZQ1nGdg57rkN12TUxrdCGWv/FU+v2V50nGHup7Sl
         bTcylULNu+O/EvjwvCwtvwHjJcWxG0RtD7UQXaEYkFI9gnZ4ppr2Oe9JMLvO13fodhP+
         t3ffNfcJsOwen9ChyB/EEt9TdwwT5kMZofv9Walc5iInxUPblLrsWYBXe3z1kBePSeaE
         3LH5sGAqxem5znxQJ/xpFotdZ7Wid1SzR0ordH8dnzR8Y4WW++SqoHOkKD7M1oQcBtPj
         Rx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787820; x=1782392620;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7JX5X2XTD4Cde3MxSmPYTnPXo33idXZtjiWq+3lvLA=;
        b=rWZQovHC8doMF9eK/XogecO7xg9lQeNvrlNOXxxqvBszYdaCcvEi2ESIomhPofjlev
         OaWTzetdAuuwmvPSUz7HGvqdsKLzGKpeS2M5U0G3rCmHcAXaYPRzrg82KcU/QEdQnIcv
         zDZaCEDCXIlOtQ//7bmlpzffBzkRQSIXN0qPAFiLqnpOYmimDkl99C3p3rO+3eyv3oYQ
         8c8XaOc32dFQ3zsvR2XLdXjkXVS/FZ3GBjEl1SL81NOritULjN5BxeQgqpljF5/1U+QR
         adzGwRwU02E8rBW5G5F4rm86lm9AVMdxwH2fsYzN6FytPtrSNyrm3aId2f1kJq8iL/f5
         VYyQ==
X-Forwarded-Encrypted: i=1; AFNElJ/VAsB9ZWH5EDBKBGrriQRhPbslS8tfDfKubM/S7cdFAFZWAkysdvjLVO481jzgBgrsySUYWkLS1N+E@vger.kernel.org
X-Gm-Message-State: AOJu0Yy78vwiDYenM6GSVj9Re68tiHTR0SR5uYSj1MBG1ZEnLQiH8aVu
	RTlIRQIgA1CiEIFVgNzXaAq8uicZjPCLgBLLEwLlvBqWzLLRNjW5m2+Un0Td4EgjOvEOKzgWV8l
	nvw8bjkfDH/sczncR/Fi0dwhxLFhgA/hsBdbJ2lt6AwfLjH6zFzrlp/+Ceczy/wN1
X-Gm-Gg: AfdE7ckJnRVSTZruqQtf9//M/4DbKcRqGGigNy/81kmlTBL9K6MQp7iUEFIRUySTNo1
	J7WVEdwKYWINjaA4wwCYidfRCqSgILeoJiD5MpvFj9Na2UCwG7rQAHc3It9tx7TdPaiTkTLIPQA
	cZQpsQs88pqIdMyMsAhv1AUnq29ZsXOB98NewV361agpis+pqxy1bPqx+DOMr+yP4vokMQCjO7V
	DwUNe3vpfRfiBARNo19O86JcQYxoD7F4kA4EFYbDxeMQt40zMCyJaxv+iTkLzsaLOBpE3PjAPK+
	Zcgm9Nug5ARr4Og8IXJo4mJfcAtI7OVWQeRx0/IvcQ7/BoQ4IWgCHrL0UlyPXSA6Y4mVep88nxP
	/3PNEW7WBcDKJqMydv4u6zx9XuTa2N5Noy0U=
X-Received: by 2002:a05:6830:43a7:b0:7e6:6f9f:7445 with SMTP id 46e09a7af769-7e90c7497d2mr4384688a34.3.1781787820196;
        Thu, 18 Jun 2026 06:03:40 -0700 (PDT)
X-Received: by 2002:a05:6830:43a7:b0:7e6:6f9f:7445 with SMTP id 46e09a7af769-7e90c7497d2mr4384650a34.3.1781787819765;
        Thu, 18 Jun 2026 06:03:39 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-695836d7e78sm1997961a12.18.2026.06.18.06.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 06:03:38 -0700 (PDT)
Message-ID: <c008fa1f-55e9-41bb-8ef0-8a9d85f2614d@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 15:03:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/6] arm64: dts: qcom: kodiak: Add OPP-table for ICE
 UFS and ICE eMMC nodes
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
 <20260609-enable-ice-clock-scaling-v11-4-1cebc8b3275b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-enable-ice-clock-scaling-v11-4-1cebc8b3275b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEyMSBTYWx0ZWRfXznUGN+LDI93v
 VKZXmLstaTbSez5Rg+Wx8Zr6d7v4fMYDXHxEtLwA6KyjicqJgR4eUf9NVK6KQKUXcoU/svp0yk1
 gRT6HP6Kho2vt1ss+Rrmgy27VFRxZ8hQCzdJOjv5N6nJmS1KppZpKN1YChdP9ooIoj5RkW+Njqh
 RU2SF2DtauUbHqCB4+vr9D/d2sHiKBUKYJUEmZJi4f4hHoSZTltFYSCLjGbmQ+a7x5eJOvqfEk8
 s7DhXhCA/wrkRfdjXw1bR8CuX+FB3WDi4w9EnPnz8LkQ9DVSQU3AKF3N+rsxynvO4wuO/nSomKv
 DwD+lR7xUxzQmg0Ic5WuNwxB8DZ4PsJxN1VI9hMtRb0j2h2pdgelUG+RNHZboaFGuSRs0rTLmSR
 T8RP7B9Y/2rupWuXTDKxnZBP/KbE7u14bUaCyADu1l4FcNJ5GWlvHVS8Ri1qxPjSNAbJUSLvSYD
 GtJYHAb/I+dp00wWcHQ==
X-Proofpoint-ORIG-GUID: iRPCtR_o2orVpDE6b4iUUAxIdbFEGioO
X-Authority-Analysis: v=2.4 cv=UrRT8ewB c=1 sm=1 tr=0 ts=6a33ecad cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=-W0wxAWcNmATYll7EfoA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-GUID: iRPCtR_o2orVpDE6b4iUUAxIdbFEGioO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEyMSBTYWx0ZWRfX9jnQphLMyTgQ
 YZKQFciYA3VVcKTI/T/VxrKxPAACMEINhbPyisRVEPDOTOlsYGtx8ZEhCgcgAI9aWUGldlILewu
 1aUSznRh9Pt8JsZ/05C8oZh5m89iGCw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180121

On 6/8/26 11:47 PM, Abhinaba Rakshit wrote:
> Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
> an optional OPP-table.
> 
> Add OPP-table for ICE UFS and ICE eMMC device nodes for Kodiak
> platform.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
