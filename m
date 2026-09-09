Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5183748A2AA
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 09:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788947830; cv=none; b=XdP50pFlHLupATp5UffRw+Ic3ST7+2q3q3DXnfDc+nTl7DtFN6H+xIxv0NfLIg7Hq1AiTdnjzsA1X8gLYMPygSVwOyuWMe+AsIXsUxnXw4LQ719dFWHg6J0V4UZjcKs69x66DtyAeGygEyts1uuy8N/B9BpiVsHjo7Lfd4Is/5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788947830; c=relaxed/simple;
	bh=bCRdocgWpRy1emNSVrGITTD8CnI0KMsb/yc1qbFz+nc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BVULuA8IYigGV5oSZJSEMyGbeoAPCfM3SCdo5KB0mShdMWkrHPdG5UBpL+b1c3+e5OV0WYFiQ4wSOB/4KI9nNs5NeNv5lfKSkwTpJOpSjBVdbt8OF4Bx38tHui3i6lwlov78BDeEDuQHRs/IIYsXXZQ+SJDG2Ed/lRdQiMgkFms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nNnOUtFH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BCfh4Ftd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nNnOUtFH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BCfh4Ftd"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896e6Oi3817275
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 09:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bCRdocgWpRy1emNSVrGITTD8CnI0KMsb/yc1qbFz+nc=; b=nNnOUtFHsQiEhRzg
	HNmno50vtje/cdLK19xO/5ypU6XWEyFrvnDVrgL59km+2dKlWnGpa8BRoW0PoyVq
	FuBRN2RwBzxEud8OL4KszNO2wBbp3H/lXL5n8fO56CGY19/j1w78bBVOha2Tt1J/
	bw5AsVywQDlNGaCSvVRF4JslUL6zeOHeJlJL1FKaYuBf2efWuLdvfkyPAhDZ6MbH
	AMd7ip7/OBzPZhFsiQNT8MxWisg06UCRgfpDelQfSGQkKWI9LSJ4GcbjbnL9pvrm
	wh6WFwaRh4/HGdxivH/xOVK8iAhuMcZq+lB7B/Yh9VNjOLvKLn+/hfakb9PGSPRi
	KOfjVg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjstuamu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 09:57:08 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e80ce3597so101497586d6.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 02:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788947827; x=1789552627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bCRdocgWpRy1emNSVrGITTD8CnI0KMsb/yc1qbFz+nc=;
        b=BCfh4FtdL38Jm2p2sxCCM8UJCXjvC1r6q58AkZpOCScd2D42S8wUcneuIgUZnMXhSI
         +a7O7KTgQSuMwKdyq7Bf1eEW3UN2nMwqwYVIW/Ns5dvNroKCs3+dUNt9EEuwsWnbA2EX
         2j0XTE6vw9k5sNVo0BWcHR4+PpHzFFJQiLlK/fbrvFqiHqk9gcjs4dptW0FYzqADYPHR
         LkIS+9j2FIdJFfDDEsjwU7/o01XHcjMsEFVEwfNenb9tB5wF8Ops3zrms2FzKjIOUyyJ
         9yYJ+2jk+UyE8emL6RZBwJ3nYci+fTzj/404Vq+F1tYrjeQRPku4est3sf3Ax8bKKmUT
         0gYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788947827; x=1789552627;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bCRdocgWpRy1emNSVrGITTD8CnI0KMsb/yc1qbFz+nc=;
        b=DobdR8RFQyLKKYVFYtccmG+StU9dluDVoDRTnP9Y4JW//3QyTHTO1ge2aEz6ik2pOp
         bPBa0YPGGbF9I9SS7lTmoUAmkYQwdRYlrjHR3+nhxiBj/eXNNm3XQxXIJV/EvTBzaudj
         NsTUt58HcnQCLgUvq9DYhSBIfINkfTqVu6iXs+cKJCY+EBKmP3OzJ9pg3OkivG6OBbxR
         1Gkj/xb/ldKmr8gdXddwPHheb3jwm5W3d9jetrpT2HrGsyqSiGQm59cC5kxrsf1X74xV
         RxkiBIWmmdKyvud142xPHD8c2pQFHdNk6EkFAlGIbGi87NyOSBfsTMUe2wfbEzl0l4F9
         MR9A==
X-Gm-Message-State: AFuF++lpclBUfzXrZJMtv66tgKUoMnNIAgSfOkzbnt6Ykdt6YVqchBpD
	AbReTwh2HZrxM0jtzbsYgAmoDKqiA6RGgeLajKHeHa7NViuupW9ITMykBU1mI/wC2c1cCDbtCr5
	xQpjEnyiYFtkSbrrqWRNYKPtFJZJBxVGs43B4BA+tCjZ2fbFtakJsmm6k141H1jaTXYEECXj6
X-Gm-Gg: AYBFou2aKgCT76x8sAoC80S+fggZAlndsRMVoUFq/rUO8GVJZj9m8TJKzoNoQS1hF1N
	dAptM9UxruIQapE99gtY79Z43riKW9st7lGlJQCXEavpvNwBL8qmpwVdqcGYUMw/lyuepsCjwKp
	ee+jms92RU6s7Gin8WWaXtQrAq4g4mtTO/lefjnfJZ0GnUVVVDtFaDnMUFbP1Z00vpRuhrjor4l
	Ut2u+null+yVaT3G9V/4wGj/U7B17p+TGfCk/mF2pUmO90HV/N66rmhSaHV+GFyIRiU/AWK0OOj
	ku+rEt/lFbSJz5VX438YU1H1IurXcksRPdwMgsGDVSIuO/HNnJkLHvbYovEqCxfk9GP82SYgdLS
	ecH1QnMVWpXDcESAFEvJdsNfWYsoq
X-Received: by 2002:a05:620a:f0f:b0:937:19d3:3fda with SMTP id af79cd13be357-9398042d815mr3819780685a.28.1788947827505;
        Wed, 09 Sep 2026 02:57:07 -0700 (PDT)
X-Received: by 2002:a05:620a:f0f:b0:937:19d3:3fda with SMTP id af79cd13be357-9398042d815mr3819778385a.28.1788947827089;
        Wed, 09 Sep 2026 02:57:07 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7740d44sm1004938725e9.15.2026.09.09.02.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 02:57:06 -0700 (PDT)
Message-ID: <1e486a39-1327-4199-b493-25f73740dbdb@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 11:57:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] dtc: dt-check-style: Unduplicate checks in
 check_mixed_indent_chars()
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260909-b4-dts-style-checker-continued-lines-v2-0-c5cb4c9d9b66@oss.qualcomm.com>
 <20260909-b4-dts-style-checker-continued-lines-v2-4-c5cb4c9d9b66@oss.qualcomm.com>
 <20260909084654.B69C81F00A3A@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260909084654.B69C81F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ItAutr/g c=1 sm=1 tr=0 ts=6aa12d74 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=9ZkQsALANqwWZhioCQMA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDExMCBTYWx0ZWRfX3vjmHpCuNXyP
 Edq+0bQo5l+KgNHZHF+rKyym5L3UoniXg6+3AZm0jlkMS3UnAw93klKQmDaoLdGzoe9DwU5a+ay
 ohiHVIT7Dw0RLbrIr+mo7dCtrLnXRKA=
X-Proofpoint-ORIG-GUID: OsMYpBLPVXG-m0O_dhHqBwxnRm47pDr6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDExMCBTYWx0ZWRfX5QhCYKnruP1W
 VAPdAqEPrcusUAMn8jZ0yQLLJWwmpV8jzNPeafuawZpalpJwcMYz20ykpVKnXDGvnMdeCMU+cje
 yej/PAuwT9/tIXhx5MyCkuGmu3SSs/bIWCXOPC4VK8jxSq5PilZoD1MvZVNzNQaimbeI5fmpX3A
 IJR/xb21jSD0W4XzK5EuNsuNxa5z9IenAouffarkGdcJFD5bm1FASD/xSksYpttz3gwV0iYg+Dd
 nSM8QL9sdU1q9mOzlrVFY5SpFosr+OU+dLGGHWeeXOIbYqag8T1L/JjR4vkkLuv8TxPT1CCmpcz
 e8n3amZaKIKOvVMxExHVpiVKdzp/D9Um1Irhzm0Ke9k+AVEsG0IMLpgE//JWsUvsQCCskYK1tq0
 ziHq4YGDQcstQPdiO+6N0aly1U4wAqDn4auXtROE30pJjz8amlMNq9XA3siWPwJIe/8DNlwblhZ
 da4/Y4erOckVrQq79/A==
X-Proofpoint-GUID: OsMYpBLPVXG-m0O_dhHqBwxnRm47pDr6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090110

On 09/09/2026 10:46, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Undocumented behavioral change in loop refactoring expands indentation checks to continuation lines of unindented properties.

Ack, that's desired, but commit msg should be explicit about this.



Best regards,
Krzysztof
