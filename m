Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D4D36A03B
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 08:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673153; cv=none; b=jCPE1YE+6wa7WP757yNgy/PKD8AWCIiz4p0C25rI/sip10pjqlTITjtaYDAOxLQY7CUl92kCfwDGXwtt44xyoP4lFukkokAR4L9LY/xH1ZLAi6mS9UlwyQNwUK54q2sWJWKxHCIt9OGbChe4gZTASuG1IQBWfnbjyzIcKZJfL7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673153; c=relaxed/simple;
	bh=93H6QnCZTWco0dDKzCEqp+f1r3474kSBPomyp0+wnns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VhMTlrZqf/IXi9+S0LLRxyXTbJ3i1xqXg/Us357AHRagoCacKLEyF0H61i26Gas0gx1QIoiWmU9a4prG6XHNNtdjHQ/AUHTCCDp7YoY3dwMUUe/9CTgqgPZWa7SJjH7Fd140WH3oHPT6R5unYfa9xYvRrAoV1DY1AxiMZ6kq420=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NLPEk8Ku; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dEmSexwu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NLPEk8Ku";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dEmSexwu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7ddB7172577
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 08:45:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	92BYDITXUy/lUIpojbG4HaYyj+mWGh/4KTP7YRWB7Oc=; b=NLPEk8Kuh+jFvg7K
	iSp/0ZSe1/Rm7g/xZm1arUFNwRVANAL3AAJvGpTNyr6egouHIIRWrg2+oaIIIKy4
	tSTMD254zOj2MCZHLD0dLDuOvY8nLvFDgtXWzURYBQMitbmTiHEXEkHyQhJ97liX
	yy7cq2X4OuwKb6J7z0tb2S3a0iTzVpWUd6MAl7Sy/r+PZ8oRWQEhrKAgyIx9KE9J
	nBAKdmzWYBtDu8CS0Enq+bNElhogs3LqM4ZHLZcqFth+p5J/le7RvELKSue5OP5N
	R70KJnQVB9hXGNYvee6THGQ+IeCkKn0CzpbzbtgkhfF9tvkk/tbiR6xjRQhpFW+x
	IWF4Lw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fanwe9mw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 08:45:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e59d97df1so19628385a.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 01:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783673150; x=1784277950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=92BYDITXUy/lUIpojbG4HaYyj+mWGh/4KTP7YRWB7Oc=;
        b=dEmSexwuYS+pL2ph9W1A/BZBM2t/10zczlJQnUDp452TCLDIpOh/+IVbxrd36pW+r0
         FH6YVn/M3DPDTd4mmI/F+9TC7StplgXa3j17slbEF1atc5xte5xGk2fwvLf3A2q6ftuO
         6Nw3jrt58mQMK6hiN045zmj9gdL3dHwkZS10owNYEOxqm0Y3nYUyzPiWXqa6lnC7EBKs
         gouAvp5espEur57PhV1q/uwX5qCmOBxkIKUD8grB3ZZv/qQYTfZ8Hm6XaFMZkoZEnJb7
         VXhvrXB0/AKJHTkCG7FybvILVNy1XMvqPujIoRT5soqYZ7XDmicGQBTYl3szzZGXi76x
         y8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783673150; x=1784277950;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=92BYDITXUy/lUIpojbG4HaYyj+mWGh/4KTP7YRWB7Oc=;
        b=FvbiFxTcldUeGnwFfz6XEIrp07W5Bcgl3nqpsJ7j+vtUfHPY9cTV4TLtYFNyPbnew8
         REfDH9fTFO1XiNr/JEImTGmIy25T2NjcdzoLinFp6+aN0wENvMDwEi8QE7kqxFFviroJ
         5FWztnz+ZFh1hOGuX6EScvoKCT4vO3YpzKoBq6atTZfRNdKvMIjs14BX5z8L8KAfsIP/
         0E1hFeUSgR+oucPFub9AJbr6pRI+sed4C8rW2uLvXTAZisUUQFQ3+L91/NCc7AX2fO8X
         +siqzmzRTT/83nMTEKC7BoZASLZ1UoSmaOvkOvboe3DupmI5pHRiuy+uZixXR60ie0If
         sF4A==
X-Forwarded-Encrypted: i=1; AHgh+RowWK+iZMQBPB90nqAa4UpPQT3ET1KQmDipDEgaR4Z3VUWJ3odmF4KKITh417vTRlLlB6Xi6pSAyORA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/+Fw6zaSBu6QHZCTRPLHmFsoRUKcgga6XE22qZgyHM9Lra2m6
	CM32qfjv4mbSrNPhsagh0VE6SFW0hjxlURoufKjLt5T3CLkwb+7b8xGGyX+zdP4HjkWYc6R4dIb
	c0a50+oP16/w+fUKjf22bXZf9v8nH8mYN4lb1yKewgB5+/1m+LLeTtt5BPXZ352pfoOGnjOPs
X-Gm-Gg: AfdE7ck2NEUpGR0EUpWZNUiu7fg3AwbZEaam5LZfNRoVLU2NcDKQd62lYe2rwr8fVv5
	jIByTxXG1OG3cVOUYZDCOXxSvI8dI7y7ID2k3ukmSVlHhILUI2BmjWtike1FmxshJCYVFoEWzFU
	AgrHpJychtj2bo0e2KJWlqtl98S3sbqQjjeyvJS7SEcyzeFaXTHZp4LO4BUrvh5BqypeGAUvFnv
	wA6VbqFbGl+fD4vc1ktNLkvTwS43gRytk79TlWQ1plUexYKYeWkJCBQLxKz6Updl0PyGx0NkWro
	07DS7fzCqRgyqNkvT6VbW4lEIoojkZ2X0Ba0z8qUeauhbJk5ckxWm1wxl6YjYyY6uHmKRCE0UAh
	oIqjCphOyL6KrhJCIeduZr3r53z0xkiTSv38=
X-Received: by 2002:a05:620a:19a7:b0:915:fad5:9096 with SMTP id af79cd13be357-92ed7a2f551mr622063485a.7.1783673150321;
        Fri, 10 Jul 2026 01:45:50 -0700 (PDT)
X-Received: by 2002:a05:620a:19a7:b0:915:fad5:9096 with SMTP id af79cd13be357-92ed7a2f551mr622062385a.7.1783673149895;
        Fri, 10 Jul 2026 01:45:49 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c3f5ca3fsm415859766b.51.2026.07.10.01.45.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 01:45:49 -0700 (PDT)
Message-ID: <e233721d-5e84-4edb-95ce-596f12cf557c@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 10:45:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8250-xiaomi-elish: Remove
 camera_front_active pinctrl
To: Xin Xu <xxsemail@qq.com>, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <tencent_AEB4238D8669271E5C1CD19C2C61A45AD108@qq.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <tencent_AEB4238D8669271E5C1CD19C2C61A45AD108@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a50b13f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=dZbOZ2KzAAAA:8 a=1iJjRMtDBWalc44gueMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4NCBTYWx0ZWRfX338auENoVmaK
 plm3DpeIEWpsfSblyN3uNsh0C/iCuQVLeitxrJjtgVkHpFxfY3Z30Og9mTkIn46dU5VR4exVl7u
 1USIm1L8b12NutPN9NUlh5j1aJ9ANa0MOeq2RIRWvyi6fStKE4rvS2viDZv51nJrH4chzGgA7SO
 2cFmd2ZVihQi3EX/tptfbv79MNOxrnUOZgSW3dJDhYWVNmjQrIMJZKV8/trHLHvT+d6rUmTXKcR
 1NPQqAWTWkr85+qXroYX7yikYWNaXVdkYoUvAdk+DLuUj6Pl7JUdrPXxDQHuMAz7o4tgMSGJwUR
 mMaY10P6toWMGMirrt4ky0f5kO7rkcezgv+9bHHq2vIC9yWDo6lD+ZdMdzucKUT4la/29D7nngP
 YBQAAjf5IwnuKmVq/UWycOvlGP6/oqKDSHUurwY+D1gcbFrYxRuMvwX/zW3mbi5ZTHpRvcoPowG
 FLCFOerdGzylmUc4fEw==
X-Proofpoint-ORIG-GUID: Gg_BUxku-FHsAfqqDPtQZiVH0tM-BXoU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4NCBTYWx0ZWRfX66/66PNSNmPA
 LxLO8eGKUxVuNhE8sEWXqXIiAbAb/DmRTmdTuSe8tiZkHqq3dfxjujrFOpSK8MPGXZk07z9CXW0
 e5UlS5Lz5OKkz7jp+xgYkECIZqeZnZk=
X-Proofpoint-GUID: Gg_BUxku-FHsAfqqDPtQZiVH0tM-BXoU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100084

On 7/10/26 8:22 AM, Xin Xu wrote:
> Remove the redundant camera_front_active pinctrl node, as its GPIO 109
> configuration duplicates the reset-gpios property.
> 
> Signed-off-by: Xin Xu <xxsemail@qq.com>
> ---

The reset-gpios property lets the kernel consume it as a GPIO.
The pinctrl state ensures the correct pinmux/pinconf properties
are applied.

Konrad
