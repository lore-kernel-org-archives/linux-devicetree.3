Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCB93AB28E
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 13:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272263; cv=none; b=WPYj90LZA6INfpJmJyainD0urM5Jmd3sYtDQO54T4o0zjPpKxCZMOzOXIHNHjHWtksHCHbSGg2yNB7lVcFCsBfl3NJZFpuGiDXOIJbfha4rhWlS9vQlterdA12Jw89jgxUtmryi5KiO0nrIlSotQY8eZ3ZN+chutsCjEszk+7s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272263; c=relaxed/simple;
	bh=ejIqjgFxGi7fu7+NbT+MIv4xGCb4y47TzhECUTKiMMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ur3djRrHeyqLKRKZlKDO1CpjLC7XdrkmEYeyx+beJGF+o6hgAeR41sG2hZUefzongqRPNDNFNe7JAAd7dd3JimtHb7er6aeg8oie7mH5pXgq1gl/vKVBJIcCaQ7RxWUUIFqg7bfnKJNfhXOwC4YmT0I+uAqcfWY9Ad+28bp4bjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q0NihRRz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OX/PgeFV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q0NihRRz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OX/PgeFV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7ttsc3468155
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 13:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YOpdTUOG5Rny+ZgqmmFytRsPX88FDaNd3QT2swih8XA=; b=Q0NihRRzS4JUb3oS
	JrgRJL394cW19M2qk/o5xSLJ8JKkYjzVDWN9DhRcW60rxs48xA5LQRKcqb7oyDBc
	mjMVpIVcRyFW6JAmvQ3szyzSO1MOjIjGuuB1lrP7P1hLUElYa5y7P5lRy2V//4Wt
	XK8awObFuFVTy0pdX//Nk1Ij62V+iYh8snjGlb3hbk3eeXbHWza03kK4ejWEo7Yq
	XOfL3otF/7/eBTwGGr+2UhT4CcUJ8mUIxrv+apm9+bKDPYbMYprbOfSfOoh9FnPA
	8d53M7ZOht1wa66wb84PYQy0VE4WkL/iePls38TOIEeaP8L3BupUUGWqz79biclb
	TzRpRw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jgh6bw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 13:24:21 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-829a9d3073bso1489788b3a.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 06:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774272261; x=1774877061; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YOpdTUOG5Rny+ZgqmmFytRsPX88FDaNd3QT2swih8XA=;
        b=OX/PgeFV915pNT98KvyBEPW6X6+QIhLjF66DMkd2wj94k1w5cZsKy0IGMsvTuDAHCZ
         7DpZJ7yTYN0iD8O1StCgdAVANlP9q5WSuhrP7XNPYruJDI8buahtLc2q6O9I11+feebf
         XZTGEjhN68kE+3QL7P/skHg6Sr+Mx3wbe6uazkI4noblzJcW820L1nyoPxjEoBZ/edAi
         upy6VC16HwFn1flva4htYv43OuG3BNB1RVNF30WjnHACxMLMK2pqRV3RaABpCdK930iQ
         QiK5H4TkE46ATM5Nt+7yB0P3+nnH614v8shGcW4MJJ0jbtSxfDCMfFCnA9spBWGM3+t0
         po/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272261; x=1774877061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YOpdTUOG5Rny+ZgqmmFytRsPX88FDaNd3QT2swih8XA=;
        b=mjf1KsbYnJcvjK7Oe2b1z8EDQLvxGIOyJXZHhvoyoUPNgVGe0nz+GVqJA17ZxSjEIl
         hTEDlPltdbCBbhVZfe7N0ZUnTUNkpRi4xSOLPCumRtMEteVWZQJhb59ID+tTHbMQJip7
         UdMjPoDp1ff7oB+1eadaI4ONxi2KplGxZicUVv2LgB+yzLQKnWEVSttxFsW11M9GMtQV
         4PYs3/GyWbjYRRbWOXF32Kb08kMwdcG7tkGcOEdvCkouMZr0Gr9t9Ri9GVu6bRZW7iAF
         /2MwYgEntuqV+Fv63YwLMzp78ipjKgulaENWTVzyBqVyaBD2oi/ony3R2OOvRV1yBC5X
         Y2fA==
X-Forwarded-Encrypted: i=1; AJvYcCWTb3sVNX8AVUuNFNoSiBEaTLf3git3tyBaP3RUuR7nIAXxw5wPvEbQtmyfhRN6eGdokzbHIZfNlz1z@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/81Iv0EsZCGVrfNFMtSxW3IUA+z8fNzuCw1f9TdHWGujp0s32
	wBa8bWmJwl+n55u/XbdH4kRqs31TB5VYS6r3n9cIkDvLUltWesxZDh7dky0bnU8aDtN+qq0r1v+
	Y8SMd5odN7G0s+cpKluLPARlpiQmY3THwmzJaEL0oWEVxd4r71OG8BzSxyUV2e7Yf
X-Gm-Gg: ATEYQzxUAvtDJyhuE/98cf6oiVpvcnbFJXitwghkc5STEOSS//MOPTWO2EbLF93ubRp
	pu+wJoch3IfIBrXVxQpPwXeHUs8RGil29EihV1eRYEtlBiHUg4Eiad/x6nREbvGoi8a913wzWUw
	UTxWG7woxTONsZt0FCeT88+a1Q8byJUDgI156N14DioMCfIfw4sftE2QKshVoJKE7uCHFDZKzQY
	xFlmaZuvq6FXDbDCBo77bOgBsZDrOaHLdhlH7xApnEvvIuL5p9bVEO86QLxPQccrcbhn8v8M2Nk
	26hKLz10eO968o8hCnp7hUqydMIt5nni3JNNuj+BnC6UmtamtZS+F72gvC1xyGyxUGhRMTwIyUj
	nzCwh+cJdRkbbl0vlXns5dL/CFluaVh9RPBUwgSMCQu+tOOIu3gFhlZiiMF966CA=
X-Received: by 2002:a05:6a00:9505:b0:82a:7f6b:3fa6 with SMTP id d2e1a72fcca58-82a8c398098mr9176571b3a.52.1774272260763;
        Mon, 23 Mar 2026 06:24:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:9505:b0:82a:7f6b:3fa6 with SMTP id d2e1a72fcca58-82a8c398098mr9176549b3a.52.1774272260275;
        Mon, 23 Mar 2026 06:24:20 -0700 (PDT)
Received: from [10.217.216.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bc6745sm9792648b3a.23.2026.03.23.06.24.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 06:24:19 -0700 (PDT)
Message-ID: <4ebca960-93bd-452b-a6e8-536223006991@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 18:54:15 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: purwa-iot-evk: Enable UFS
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, nitin.rawat@oss.qualcomm.com
References: <20260323-purwa-ufs-v2-1-58fb2c168786@oss.qualcomm.com>
 <0794b29b-b999-47b8-a563-b29fa33a54f2@oss.qualcomm.com>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <0794b29b-b999-47b8-a563-b29fa33a54f2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JIH-KbrO0BEz_nZpNGY339okO-TxGRyx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMyBTYWx0ZWRfX7XI9H3cXIINl
 /SWYkrRY+/uKD6Z7+hJEJePRXLNe/MoZk5Av8QR9tg4J5cUP3HRZ7AuZzZjbzEfybABwquv9lTg
 xXMZcNDabFJYW/c5AKL7ofMz0EhTnl8tnaLqhV7LfZ0TZF/OiZrP/L6AGPZgh1oEEQ/o19lGRnW
 Amb/JE9XCCBbKNBsezqBWoi8ERV9hf2E5dCjYq5SSci7BKR1Ufj+79PMlRpp1ILb89nxcqkdt/c
 0jYUoavbxw6iIlLtM/Kit/iB+nd/lRBrbDZfim0n3laAqNSFE/QKAY8RVRw8EBl2uak9qCwmz+C
 XJJj2PlBGeM9ECEfwS54NyaiinIOI9xXBGwTJroUNojlnwF4ZPO0WJS8Hns6zVH4hmp//sWVPUT
 +WWAAdK9iqRmWERh1UUhfk0Bt4KZWLLlrOCQja5DnttQt8kkXD7vnRl2TNZGdReCJdDtkBdyC73
 TET7BUbBOZR++CUPZiw==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c13f05 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w3AsEPM0cKjnORHfOHIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: JIH-KbrO0BEz_nZpNGY339okO-TxGRyx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230103



On 3/23/2026 6:25 PM, Konrad Dybcio wrote:
> On 3/23/26 1:47 PM, Pradeep P V K wrote:
>> Enable UFS for purwa-iot-evk board.
>>
>> This patch depends on [PATCH V5 2/3] arm64: dts: qcom: hamoa: Add UFS
>> nodes for x1e80100 SoC
>> https://lore.kernel.org/all/20260211132926.3716716-3-pradeep.pragallapati@oss.qualcomm.com/
> 
> This information should live below the --- line (in the ""cover letter""
> for this single-patch case), as we don't really care about that once it
> hits the git history
> 
Agree. The statement below caused some confusion, which is why I added 
it to the commit description.

If one patch depends on another patch in order for a change to be 
complete, that is OK. Simply note “this patch depends on patch X” in 
your patch description.
https://www.kernel.org/doc/html/latest/process/submitting-patches.html

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

