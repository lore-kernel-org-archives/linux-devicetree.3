Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2723BE17D
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 10:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783075132; cv=none; b=OAISDFBhaszVUruuwlIi8cI5gfLXi7SMoTEDrN4CnDjicl0jNw2RVnQgfkO4kZLUhMvJtdq8cLqViyFCDBRhdrnaS59SPE0Cd2iaZY8tTzTihBhltRw78dxGnFuQ7V/cDl2cXUF2p+lGdeovve+D6BLPeWOXQOm6PeG5YvjF2Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783075132; c=relaxed/simple;
	bh=TLZfpXNa4jTlpCICpFrGEXH2rtYeXj7nHX5GHDbou8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oz0FObKhFAEseA9hA0mVI05BD5ZB8g5OfxOcSyDZneAmZCa7n7Zrcac9fvaz9T1N1VtfUAxJdOMk1AqgRS8WNgGNs0cVfn7Evbs/MiBnyy+b5IUQLJ1ir8vlYsgtI+ON3OgJ0t41RYza+JZuGXet4OpIjEdQOLYXRDcmRrOaKQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eRvXERMv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OOZ00OBl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eRvXERMv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OOZ00OBl"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rflt2994880
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 10:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a3RaEfFYDUv0hytKdheuNDDTJLMkZO6ds3f7R+dKZTQ=; b=eRvXERMvJqO0khyF
	nE45Jp5cvL8zvZtV71e5sx2xQn9KD7LdVoOD8hU+jjZRdfArthDN/z2DMUDOQ7AB
	dQwRPb2637T/vXZhg9ACdZn0S2AWnOe4Ip2hdTsduVyxCJHGA5SRoYCma+pU2rFf
	/i3Z5/iIkStFR4QiU96wDkqaX3QH+ssHPACrsXeLg2ZwAYwBuhtbrZ4O3uYH9dM9
	ScbqyI8mEGA8FFc0Ckp8GuNBS0QZOYyReOrQz/Yzr+XEpDSDTLD7xhGRCoGhB45k
	Irp9u+gGWoG8i8wdcGtwuiSrqnxxlKsZAlPhAJi6ZfeVJcM1rjSgENMf4xNSDjFD
	byCAGw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n1wsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 10:38:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21be5bb4so2987271cf.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 03:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783075129; x=1783679929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a3RaEfFYDUv0hytKdheuNDDTJLMkZO6ds3f7R+dKZTQ=;
        b=OOZ00OBl15fsaLUrkLQ/i6e1Gl3OW4gLCoFapxrzbwlE8n6JeEtUYJQfiRby8y+7G8
         79mF1v27MKLOlcietanv5AO0LKrM3zW7LuAqdOJ1+rH0BaIWzXvWEjxanQHYlDiVQwae
         Z61BQbb/M9O6D6Ss1EI3vmAy/LC8SuqVUhRQAa11SRnf1nCPasfb4e3hk6tWl7ZbHrYA
         iuCgTVR9Xy3f8onoCrCV+ONRIRdrjI6xTHOwPQ9oZZLgmlzMZrn3vwDfVMBj0bRrP84R
         8MnR+Ks6GHijLM6Srgo1pqEKi50BoGvhV+PZ/ErA78HSK/6AH0bMQQHRJ3cOSUT809Sq
         C49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783075129; x=1783679929;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a3RaEfFYDUv0hytKdheuNDDTJLMkZO6ds3f7R+dKZTQ=;
        b=KbZ3M7+8J3tVpgF0RdyyPV1ngqLncE3KfpzPgu1AKgaO2tOe5yitDxwOt0p+/9j/V8
         4INN4IG/D7KY9xAs5rtjI+eT7uVCrIYq1aYfRdlimQeGp1badPPTac7uVTG4WhjTHEvl
         83qp1VfH8bHu6QxvOO01EvDogIpQ46mXSicLShaBtOE2vLLdmLiWAoG2FmYkWMe7O7ws
         vse9VE2wvdXcxzlLkP09YhajqAdjytToMhC2ZA6iATruI00nHy98pkRC8LGFbQu4fvpV
         QZPZiePoDo0Xg2ot+vZMumbu0glkOtWI4XRQctgSiKWvWw2kAi1T5N3qb/+cFbM3Nhvk
         qChQ==
X-Forwarded-Encrypted: i=1; AFNElJ9W2w2QSEHGKqG7ZksII1tYUM13dCp5Yzz5kip+oN1t8mXl18YOVx37ra4mENxBS+9xoeWj32ZZ0w5S@vger.kernel.org
X-Gm-Message-State: AOJu0YxrbH8HQKQxZIVBgGp0A1ZTfgBzceSHlRlmzHwaf8gTphYkU5LL
	rWkMW+4I2YPNGo9j/c4FKp47PTZOVfoA3iCwMdudZFYl2uNkW8a+3A80Y6KmnY5G7oDNY1wfGOi
	Y4xA4abDyaxBlVkTw14oX+hk5UCwSHDC4J4up4Jzwr15kTHCwAmOBQmiD10mqj26C
X-Gm-Gg: AfdE7cmhlOpK58aWFo498H2VEZ5V79tyNVt/T+aSy9VytUisJJXW/TfX38aD4WPDpI7
	XSSYh5nBF3xUu4MAHheaUuBPiU4rRjB8hZWBInPKCibW1OFbeGb+snEvos+UfQqCSAtFjX3ULZe
	CNnpt4u8c3nJkuZ6ZLiCkg/+qbiMXTy1i0JFykiSdgz9ycX68nNbdo70rTQXcbC4kYYXeGls069
	OtKl6WzTjqx2+hQV3eaWDxUT2hPzw8GnhqW0V/7/2NajWb+aBAJ8d2m1cUMJwWTZoikM37WPsIp
	9NYCBYyu7wVc1jx6IsFjlF5L6wKqlYuo+oSdhFly8yW3QhVLj9P/c18MQLLO4NPTXNlU5HIDAuc
	dpktCGflrNwpsiifjnDT5PUTSpM3Rj50uHWE=
X-Received: by 2002:ac8:7e8d:0:b0:51a:88bd:95a0 with SMTP id d75a77b69052e-51c26a41ddemr98177381cf.1.1783075129116;
        Fri, 03 Jul 2026 03:38:49 -0700 (PDT)
X-Received: by 2002:ac8:7e8d:0:b0:51a:88bd:95a0 with SMTP id d75a77b69052e-51c26a41ddemr98177071cf.1.1783075128715;
        Fri, 03 Jul 2026 03:38:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6091b60sm261765966b.14.2026.07.03.03.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 03:38:47 -0700 (PDT)
Message-ID: <bfd5b522-da85-499e-a36e-b303bde791ef@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 12:38:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: ipq5018: add nodes required for
 Bluetooth support
To: george.moussalem@outlook.com, Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-ipq5018-bluetooth-v3-0-62da72818ab3@outlook.com>
 <20260703-ipq5018-bluetooth-v3-5-62da72818ab3@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-ipq5018-bluetooth-v3-5-62da72818ab3@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwMyBTYWx0ZWRfX4uS5zPnGvAWv
 2C7FstMsqq0xI1IKzjE6v4OXxdWDpmRMycGa4btXRkDlkr0tW5ca1K3TACEbdCpGYoDsjQ7lNQ9
 +XwZeBJWHgOlCcmcQhTPapzIhhiIbZo=
X-Proofpoint-ORIG-GUID: 0onERuBw6oX50mZQ3Nb6-SYsUSspURBR
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a479139 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=UqCG9HQmAAAA:8 a=t82OjkPGvLD1vuDj7LAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 0onERuBw6oX50mZQ3Nb6-SYsUSspURBR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwMyBTYWx0ZWRfX/0qItfTdNzzU
 NS80vAo3WPBYNZxPLj59BgNqKIsL7zL6iv52QM2A4RuT+1KHgV06ODGlHC69Pz+P4Qx/+DGUPm7
 Xrn0EeWCy1eOxgo3vcxRIkTn0A3RsECHA6ftoCoqbCmlA7SE8mHTIapAhTQSAjctzBzZwP2aZlX
 L+ps0RRO8bKZ0wYiDsSw02l5TZxvgTmkQkc80vSVOkbYpS5XKcvO+dONVoB6YJrEGLKw4uAZ5qB
 PHaYn47S9FQdavWUGXF4V4g3ODWfnxLbSWtV51J2zr0aAaWHtwPCIKPwX9BZfUWqWpIQ5RPtrF8
 CylsK+VQPe7IGKqdFItc2IPByLYzkNEfTn1Pqwp1AVELcLVKjfHkUmVHRbv7nV9RdT6e0tFCLdR
 LK6VESX2LmLUTs/dHyIvGh+JDvL0t7iVvCZJ1XPyjbj64TUpnNtnVhu1PQxd5nYZq53eUDSTQnW
 LVjYu+0aEHIR6CGzL7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030103

On 7/3/26 7:01 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add nodes for the reserved memory carveout and Bluetooth.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

[...]

>  		apcs_glb: mailbox@b111000 {
>  			compatible = "qcom,ipq5018-apcs-apps-global",
> -				     "qcom,ipq6018-apcs-apps-global";
> +				     "qcom,ipq6018-apcs-apps-global",
> +				     "syscon";

You'd have to alter dt-bindings for this to be allowed. But I
don't think it is. The functions to grab a regmap from an OF
node create one on the fly

Konrad
