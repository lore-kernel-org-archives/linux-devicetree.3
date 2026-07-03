Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC6D37FF5B
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068986; cv=none; b=VcpA968CkXO7cat5T/h2CyZa2a0MxTc3zqA4ZYEHVlpmdP4ZKsb4P1eJBaVs8vN2boslHEiHUYCNdH+HMGY6YJU8/zsNNJn1o6gWM86m2XhOvfnPEyFJwymcQVesCU2WbzE9E/IYYHtWW0/rcrZsiWNPn6361IClwI9uvmmej2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068986; c=relaxed/simple;
	bh=OLFzMuZPdcWNnX5PmC3ua9u6pd2lL8kZlZcWTGaIqkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pDj1I4VUQjH0fmmrUFtjx7+IFwsB8Uq7e5vcPtoMbUXOjAFdDAAMTKlBPxek4sBWHZsrJ0my5nDyhkG1Qgg0e4urFb+idEOJA+VugkfVQIfknZJkZPl47SCt5QTlH5LDDdZFEpAS6SrzAemkV7MYALdTuGKYGxQLnC96bwvHh/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R+KYOa2D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBpTAjfL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R+KYOa2D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HBpTAjfL"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rvWr3126357
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 08:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wl5tAH2CAN3mmlekbOVBx73EQnsZFSJDZpmN4ENmcAk=; b=R+KYOa2Dc2dM+qws
	fu6KRNuRqdq6Ze/7iE5Yg3glPymA8tU2B97B7UP0dLf4MS03F4gsyh5E2hA6dOun
	4oXc3JwJuFtud4oMrFZRlQqPhHhgMpqe6lybGKFZgUOKa56Rb1GZqNapicFsGEAJ
	ooSYqE0xBoJLM5V4weXEzsQnCMagapxJYgxiWfD53GblZadAiD+unz0ZEq7oOu9N
	Ef8rfDZEYgO/rbkucLROEy/omo3Cp0nC+nVb669v5xsAS+Xgw6bVJqTnA7WX24Bt
	drpaiE0cFnqhbMj7fKj00Rxw7W32xY9V+TPpLnO+NFCEERJyPZVkP1vuGICpUnaA
	6VdiLQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpnkmsj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 08:56:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e68cbeb53so6862685a.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783068983; x=1783673783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wl5tAH2CAN3mmlekbOVBx73EQnsZFSJDZpmN4ENmcAk=;
        b=HBpTAjfLeefh+wcNH+rPa50Jvdx1fGDnwHdZE9RN1PzPAuxsSpWTTt0s99SErQww7l
         mv+wKv4vdOWDabmin9Gjluj8DBK5NRNWYaji0nvHK0bbxg20381tq17h3V8IrP6TFkp0
         ep7lxKLjcPuYWmU6cZuCVnWZv3oNPVXeDh0ME1TxMr89zRXSZ1dQNri85PkIToaTJPtV
         gOJ9oQbigB00nSdUIioNL0yUC7lzzb1K6i0GMjUD1TFHNuFWjDtNMiaeq8ZElMQIg/oE
         750LBQn6HmNhcJqgPHsx9jw+9rzyphBjvrJkavuZYXavtdJ6yGFUFuIfby3GEoxQBCxa
         W8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068983; x=1783673783;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wl5tAH2CAN3mmlekbOVBx73EQnsZFSJDZpmN4ENmcAk=;
        b=R+5AZ+aAQAxayqYR/07fy8Kv8uAQWLdEv3T2vrCmLzjiVNxa03tBNOMaY9fsULIzWi
         o/2rwF8tE8PJCBeEluH6W+wM+SN6LU4TGrYYID4twEsdqany+l2AJaUdMmihrt0m2DO8
         /+efvWqDNneDdAid86PKNnLQTyJDBtZ2iqY04/yRsa31rchSFP3jkupfDviQhYYRVdJX
         LmmIXYr8u32FI5pQoRe3tu1Vr1Hi4DZtxpODV436utNoGyCfpz73svwi1E4axfBW7VA4
         H3MGlwbNss8qvp4iRe4vGwxQUAP8lvhXvLDgjnsZbyrwc020rvgzBIdtNS5e4ecLLKF6
         s/nA==
X-Forwarded-Encrypted: i=1; AFNElJ+1lLvFENKwgIGOz/ALrhTdEyXOrBQK+lXd4Vpc3LVEU/cRlq/86tFGT1cyU+vzsJh13SC0C+v2juns@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhsf31xomeYzbVOOLrSxWxB+yezLlB9u90R80+t12TR9REJQk9
	wdWoy9nehthJnIkeiiUbHH8TNuypYiMLyQ1a7puXhkHms1x29cbDsu3q/XyDEM5XY4yfwqUOIqJ
	nny+ent16d7x66PmMk/wrz4BaAqtD8C72RSaT+37U36YJEmn4KRfYXMnctJNmVzAJ
X-Gm-Gg: AfdE7clHuN+kVAiIsYOM5PbvDmeAPB/p1Ap4spcTxf8tIz/RzrjdafFEcMxUnJISxCe
	IfUeOvCegpq0GYNmZj5aQe/x8ZmeXLuH9BSwNUsgPL3jANLRIsduKTDA7fibYLcbbE3tbbHGb3z
	bEZsbzkNvkN7l9DZZ3q1SMrhhMFUPs7vUl2zFwIvVTlqS/OI7/3FQMN7gNS129Pq1asI5RNA0uS
	WgKHDqSaDaRGu0qdrKD4uzsGjfqvd6BGYx6xxwU2cm760c7nDHIBdxX8vyP55iyOxd3XQOipCbZ
	3WTxvNjzoEtcJmHQROJ88WJqRmUYPkN1Wapag5jfGpwaaR7CY+1t8BZTDIXqX7l/aB+tYTb/DVY
	p0W6nmI6Piyf0VaVGV6AnhYIVf39xapCkkTs=
X-Received: by 2002:a05:620a:19a3:b0:92e:5272:4e3e with SMTP id af79cd13be357-92e7809ef8cmr769285985a.0.1783068982943;
        Fri, 03 Jul 2026 01:56:22 -0700 (PDT)
X-Received: by 2002:a05:620a:19a3:b0:92e:5272:4e3e with SMTP id af79cd13be357-92e7809ef8cmr769284085a.0.1783068982565;
        Fri, 03 Jul 2026 01:56:22 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b629082dsm254187266b.29.2026.07.03.01.56.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 01:56:21 -0700 (PDT)
Message-ID: <2105eecd-b2e1-48b0-9795-ddffa8e43937@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 10:56:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] dt-bindings: soc: qcom: eud: Add per-path child
 nodes for UTMI routing
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-2-elson.serrao@oss.qualcomm.com>
 <20260703-manipulative-mauve-centipede-f8c95e@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-manipulative-mauve-centipede-f8c95e@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YkopoPlE_972GiUULQiu_xt80CbrMgWj
X-Proofpoint-ORIG-GUID: YkopoPlE_972GiUULQiu_xt80CbrMgWj
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a477937 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=q0dMSk5aKnwmW5Wxa0IA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4NCBTYWx0ZWRfX/pbf5qyxqxeH
 5oEJVGFh243G9TUNKg5EbstMry8uStGpsUn/OpvjfkyxG5cWy4aAEQKsW0r2R+Qw65hA3wQ12M3
 2F3v/I6/yu89q1trJCYN4G/5YBs02RU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4NCBTYWx0ZWRfX4hP2i83FmDLg
 4F3oRf02StENFcaDo8xTH7XUFSob+Jtteu6Xrq4umM9WKPPlT/4ZTAVwZNEVHpE+VfsuW4MoyRe
 c8UX9kDPyx5bqrBi6HVyhvInPtXyenMkNyXYSCmM9AB1tGTXXJS7zamtBguA/e2WFb6LO40W19k
 t+Wo5hstTE4xpCffrneVwxpbZsB+fcD3/7NnVXOQko1tSGmjNdFLFuIXEU9MHcd8lpfCoIt8Zxx
 cZpzYa7PvHGuYeK3UFAJ87DSW6MgL6S/upN7yH8gyIOKDakLN2e2Fb/MfpreQ7z3mv6gZRxlvJJ
 uEr6jChdl1GHB1Xz/a/P79Bh1/wJB0iOFYkVYg8LuK5Qdb72Q1i3C/L2mNrkq826vhu4ytKKkXp
 /hlvIX5U0bZ257ouywmPEv/J5E4vyhx7s95Xg/O+9FdCl0BRscZRN25d3GNMe2pc6ysaLiG5HDQ
 MdSAuetq7TH0dnjfXjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030084

On 7/3/26 9:45 AM, Krzysztof Kozlowski wrote:
> On Fri, May 01, 2026 at 10:06:27AM -0700, Elson Serrao wrote:
>> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
>> independent High-Speed UTMI paths, depending on the SoC configuration.
>> Each path is distinct, with its own connector/controller connection
>> and role-dependent UTMI routing.
> 
> You miss SoC specific compatibles in the patch. Binding describes ONLY
> SC7280 but you claim here it depends on SoC (not sure what is a
> "configuration" of a SoC).

The hardware configuration - some (older) SoCs don't support muxing
to another port. The binding only says 7280 today, but after some
version of this series lands, we'll wire it up on basically
everything that came out in the past 10 years

Konrad
