Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFA0436355
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 13:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786972851; cv=none; b=dG1DEf4PFA3+KthRRFGBTx/EUArJA+soVxqVs/tW+l+13Q/MYp52Ip8OdTo/42ru56eZWKvYOuK3h5f6b1Ej2U8kU1EljPy+bUGDJ0GRU68yRXv1CvG6K83/+d3XsK6TXtaA9G/Fu5G3Hx3+WOQL4E1uWsxRPkkFNKKeWcgeZ0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786972851; c=relaxed/simple;
	bh=jB9+En6C0wpuP3D8iuDZbNRYZSDkZeqCj5UjzMgKESs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=af6A9izL3IhIQp+MAQegozpESd3ErkvJe4mOX5LszKwJVHLOOumNcvZEoGWy2AZwvbYToFfs1dB5xZuBn8WmTRZpu6X8Xg1uQUBYUOW2xYDu9vVA2QEvG5THnwwZ9WGF2aXCZnFjAxa7/egS8dSyu+GKlDEZKi/oAZ5yFoFBe/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iAgyUF+3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Obyrx0w6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iAgyUF+3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Obyrx0w6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD6J6V2431650
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 13:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nZkwYYTlqj9ZHjP4hcwD6T8+fMjAx3qby4LJRy4G7ag=; b=iAgyUF+3adJhRbYC
	QGE5a7WprO0TC42n8ntx8pOcHns3jtk1c/RdvleDXLbxWyeuHEAWKExP26f3WpMJ
	8WuOH1KfektebBJ0kTeGsQJ5ahf08nQBKQzCk4z3gqQSwk9cRXKjC7oB91OGLH8M
	YM/UgjtyiBWXxv/Cu5nUZysGxtMMICPBVUFddbegHqK5WQ9KdrHVFh0VVx/0xTZA
	DjIKyaG5poFrRzlkliOuPRsGw774QCZE7UYLui+fuPYutBSkG+F9WwJO4RjJln8h
	ghPjnO0h5P5jBGbWi4d+4dfFNeMs6yg3HsvqVkKFqsy79AUYn1Bxh/nHI8SNgU4v
	nW9NqA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wrehcpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 13:20:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51cab6f7517so2011591cf.0
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 06:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786972848; x=1787577648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nZkwYYTlqj9ZHjP4hcwD6T8+fMjAx3qby4LJRy4G7ag=;
        b=Obyrx0w6MesthIQ6rULf71kIpTq4MGgqisZyPlTF/ZadMaXVyhco1FV762gQEvxHNs
         RTKS+sdTTt9fMnGsElkCU1YAq0FK02KQROINlAFg9pmGXJcEYjnFZOq6MU3wLSsgBkDS
         AKzo63HNcdomf6N4JqGZwg+HkJcRWZoonphzbBDg1kkS00+MZo8IoLCE1PhNwy9Sf5VL
         YvNe5ebqSdkXVvUZGcDmREwWbgSI55vhOX3MM+YsoVDTYvd9fxmFsisBc3YLmL3M6oTV
         P8UsgrcbOhEyUmZYQ+xLdomKPfacbMn/ng9v3S2cLbirbtzRn7xHTrtBLuR3G9QcHT7Z
         NJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786972848; x=1787577648;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nZkwYYTlqj9ZHjP4hcwD6T8+fMjAx3qby4LJRy4G7ag=;
        b=Qrr+ft0ZowSJKmd0Pt+W0KiHtKhl0oMUKq3B5dlnjAEneoToa4tNolQ5jhrihzZgPf
         7rXvCoOhxNDXW6ArCdZxqA9u8NNhGF8BwwLcZmOb9drNmhKVQNdO9gRt2MrmrBhbe5P+
         xhfahVxUdmzfIdjAg/Rm3XJ1lT3hzfpKAW6KOJaDkG4NgvfRIHyW7AEVGQ4Lg+fYNJlw
         YjpOuF7HGEBgOXsjLM14/9IJDdtFNKYT96RKgSPzV0C6yTeRt6C0SFozmeaxqROALS2v
         dGztnk+gQqpEIBbxrk2F24vRZbUKEdw/VvH/Iqmr6vS5F7vg0SwsYStBrQ2+GLXmx2+z
         GzFw==
X-Forwarded-Encrypted: i=1; AHgh+RpO+zkBy9V2m1tzSWdBCXAb7ReNuSLIhi/qL5mcwtaSCSqOda5XkENm05CVyvr9LSZBIaUtJv3tx+xH@vger.kernel.org
X-Gm-Message-State: AOJu0YzUQJUQRkCtKEV2jxp5hiBhGw3vadArcQ6Tt7ADJDEEZAx9PPKl
	MQpFN0ilmT6/zbDAvLs/CHijwD69SCkl0gvOzJ5DE4cSBUx3V5xLJhFPAT/3ncKR+kbBVmzAP5n
	YsFlUb53ilI8L7BaBiC8otADel0GvTR8kyBxde5t4d631ba5vppaBieKJNDYOUhJD
X-Gm-Gg: AR+sD12fw2y/1rmtHRMykQUSHO805ZsO23k8e6Db/8RkTKxRs0CDtv2eRiAquBzmOHF
	rYGB9VxIEmv7v0Qwh16kfRBzucqJ3EweQjEpb9oABICjPyBdI7VzGazxH58IrCf4iPhx2j0OjLh
	HmArnQbvVDMz+vtFlZfp030yzKAQ1FStysj5s5O98AG41szjQUS1cfxAlq9c3OYYyD0iUwDzlUL
	wYf5pr5qzJEWdwzoVpRcO2aYJ9hNZ83L6pDw1Ewora7sgtbLEGjGuUJG/Uub9JuN3Q3CxvJtP1X
	JouS0VjYNdS6jo6a8v8a0rHD6LYVFyHMLjhASSWvddodAOTMapaKiZben6AGJ9qidR/Fgj2sztI
	Ta6CC4azhTFpVG76026t2S0Ns
X-Received: by 2002:ac8:5fd1:0:b0:51b:8543:cbbd with SMTP id d75a77b69052e-52d852d1178mr188197791cf.1.1786972847660;
        Mon, 17 Aug 2026 06:20:47 -0700 (PDT)
X-Received: by 2002:ac8:5fd1:0:b0:51b:8543:cbbd with SMTP id d75a77b69052e-52d852d1178mr188197221cf.1.1786972847102;
        Mon, 17 Aug 2026 06:20:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fea1e64sm60193666b.21.2026.08.17.06.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:20:46 -0700 (PDT)
Message-ID: <a7a7257b-b1df-41d6-bfb9-9496f00bb25b@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:20:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh
 clocks
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-5-3079794f0f73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-5-3079794f0f73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FqI1OWrq c=1 sm=1 tr=0 ts=6a830ab0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=-YGGs88sVoTMC7_f4VAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 1qw3rPdYwOPdaqs8AOgBYpbXbmn9oYXR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwMSBTYWx0ZWRfXyl9hyPRCcmlS
 G9YGLln1KXD4qkjlSyIzNcyrQ00DVYvVy93SBBqJn2TWA/0IXVVKk4bVw2E4vUYXQ2ijmOyxKkP
 S4+MTQQ/3oIW6Pjg3W2hDBJEeIL+cXu9fsfZb/u7hv7aYB+jBQN6ktVJYsGoNz8EtUaCVoPc9RR
 7Z6G9C6VyKSaFVhghN4Xj1C5dxa9V9JLSr7mPTRTlrSVjXG9+PJwL4h8g4mfAWZ1XpCqKBkBNF/
 VKXCspeDj/nPwzAW97LL38FhNTtOaR0YYuOGR5uMjD0Bmz4RB8p9b1cfj62JmCYjDbpu/B5kKdi
 j2n9xcaPPUQzt10d2ql+TzYGx7fstM9CQ7D1lRBM7ETjRJL1T5LibRDAfIj1CIRe4xDTogTsNUW
 /kYYdMH+qmSRLnVt/p15XknLv7INaBilUhVCYY3/l/TwEUZY2DjixRa1xWzntuYtiiiYJ4Gg8Sa
 H25DPbEP8fTRU4eQ76g==
X-Proofpoint-GUID: 1qw3rPdYwOPdaqs8AOgBYpbXbmn9oYXR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwMSBTYWx0ZWRfX8toU9EkFi8fm
 WG9DU2j53nzBMQ6qqORYsINvLss4Tktw9d8CJOUT0qN65ct6Jt8NCG0hUupAz096Y0n5IM8IYRa
 +EVaJvIYJYfHSQFli8YlTQNX+pwAUVQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170101

On 8/14/26 9:31 AM, Hardeep Sharma wrote:
> Add the RPMh clock description for the Qualcomm Kuno SoC so the
> qcom,kuno-rpmh-clk compatible can provide the RPMh-managed clocks to
> consumers: the CXO div-2 (and always-on variant), RF clock 1 (and
> always-on variant), the QPIC BCM clock and the IPA clock.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
