Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54050442FA0
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 19:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093680; cv=none; b=RAJF+mqUiLU8t3Weon7Tla5Rs+ZGIiBGeZ2oxQFog8Fy6fPNnOZBDrZM2KIWMgoZtFMdUVEtV5LmVSXim/+Kfa7H+hHxbvbCDnUf9ahSe847pk35nkLy9EE+wy+PlpUX2vak2Aqu4NvdyeU+mzxyv+Yzln+4PapRaxAR0sMvDhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093680; c=relaxed/simple;
	bh=OGpe59J1qKtUFqCU+E7+QmVCO/53r56q4vFIjT3Ui1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OtdS9Ob3XI7S1pkJuxg+qLVt1/tSp3cBUanGVnrbqOgi/uO7sv1Pp/4LQ5q6+rcn4N/Ega/ZQsO8v7t54ym3vRKAEiu1SJvsgepAJnjZq+MNYp6AwAaPKmjN9LsK8549UTvc4vE0StrxNATR8i71A1EZHEasslmthMZ+oMNHPIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cZjEoK48; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NAxgbsN/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cZjEoK48";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NAxgbsN/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FFE31h2678387
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 19:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6q3S3XwD3ss
	KNTNzg+SEXrc734GFwZ80COO3a8rdsI8=; b=cZjEoK48lWk7wepcehAUJRrbnyJ
	a1/4Zso2ZJYgbTNc9xl4/aKdz1y7YWA/TvmG++4IijvmmQGTgIHAyiwAMtQXSRo1
	HNCSsA9c0R/U7tEYNmsXaMC4obIuZDJizcFnN09NKmFDInDc9/+b3kdabJJox+1G
	v0RNRPTzKxdXXqBawtIstdLW7Au7l/FPxGDeRO7sDdNQ8rD6vJYpxi2lJOgFSyXx
	XYrP3WJPKrY0g8FOEDxiXYbngb8J+dUgMlKx2aXcM/2zFgZUMnTQ5GO50gi9UY8S
	kT/KryFVABeosVQybw095uo+29YAsI5Gsc4cNZ3sihMGGGoprGOBzVrB/8Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19t92y8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 19:47:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb6391e89so1203418985a.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 12:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792093676; x=1792698476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6q3S3XwD3ssKNTNzg+SEXrc734GFwZ80COO3a8rdsI8=;
        b=NAxgbsN/NpWfTUIZSMw3cH6CkMNsOb2Af8tK1xVkEACEsZGupw6x6RJBXey5vh9HN3
         cDRQd1qpp6kUnuct+SrZipO41cVDVx5lbQwmgKenjIeLDE/Nz6Bl6vWlmxG0dby85qhi
         XV0yjSfeUgIyrMhnHN13XzG6rbBSlhM7wAKpcGeVo+gPTwT9DSFED7cf1rZhUSNXZeEj
         /EiY6zUz347I3FrlAcNt/IPYoeGTHEYmzWzXrZRtaGmB1jUKtvhjg39/I1JDLB0tw8Le
         Mz2NtoLzRPVy5oD8+Q95Hw3lvZ3yvjU4XOrPpUkDlLj7NCnQHCnw63Sj4hQD03DjJyLS
         JB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792093676; x=1792698476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6q3S3XwD3ssKNTNzg+SEXrc734GFwZ80COO3a8rdsI8=;
        b=fNJ9Ex4B85d3aqe5CVeleW7Q5xQ3OEWUhIhMjc6ZegQjU0yfiYjUumUVGB5XsHvt9q
         b8VxTUZ8e2iOi1kHlhEoUFScvRN9X8j/PJiI94k0PTv49/C5kJa5GadCJLtyxWHCOKMD
         5zsGa5DhMN6YmVOcvGQx/tCXfiwjjpQ1tRHn9jYI7Q7Zk8swjcVPgiOkfOkNlCuxr+mm
         u1VOBB/YbX1jdKqWgu5NkVXHPXYaZlUIA/N9gfIKVOHZfoBR9vARBYM+2TKacdpb3ZVY
         UMTDG8PTj9cI7IVlKhSLaE7OxUCVvTFqf0XrvE1K6f2iFEydY6e+WwjZWr0rSdVfV0E3
         yPWg==
X-Forwarded-Encrypted: i=1; AKwUvBz+IckWkNdZhEQ2lqHNPUz04f1UgLGLgUw2M9+yjt9CdvF2WRIF7nSqaJtilnzOMQrSwjhXQKbEa8X1@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3ZqQWIS2uC1sEJfAf9X89oueJci98GBzOVUXvYA8w3K1s4Uwd
	ylm4dQut18EFUPGrhktoxhCNLyp3iuA3cFI1iiC046knUb4L9k4CeBwSkL4hJyDmeBqnGvoV9P8
	d6oXcLKolcVm+LdR+bot1RAi8KS4NYMq2Wjer03BKGT9ruyjec2mnXmuSb3BDiV8e
X-Gm-Gg: AYBFou0Rwbwmw7fEeVkWelOdotN4z3z7IqDZJGsRwNd1ibj3fWpqfV1IcF7UTQLW2ge
	81VzX0gzuif7YSICGEIZEpkGVEirbLWqhDgYU2RGqn0Gu1NnNob2zuipv+rqxmvCWAaRnz3Lh3C
	8LAeIf5QohXuhI36TZQ9S6Fvhchm4udyFqCmPDv31zuy3Yq+3j2lqzRY0YSSP91VAwwmRfrzPX8
	uhIzCwl1fy3HnaBvlB3UZ9DaB3np6+6UMGis486FJ/hBeFVs0NRHq3cMg3mJF9nzmDb8eaKsdpF
	qFTZVWC6va4SzUqAo8orUIaCPoh6wzPbfle2GxS/2uS57ycllWnM9IuYx0sGk/L9hAWCTFNokDJ
	zOVQiXPm1FR18
X-Received: by 2002:a05:620a:648d:b0:93e:4594:f5ce with SMTP id af79cd13be357-93ebd22590amr3604371085a.41.1792093676375;
        Thu, 15 Oct 2026 12:47:56 -0700 (PDT)
X-Received: by 2002:a05:620a:648d:b0:93e:4594:f5ce with SMTP id af79cd13be357-93ebd22590amr3604366385a.41.1792093675818;
        Thu, 15 Oct 2026 12:47:55 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c4fc4sm138027f8f.15.2026.10.15.12.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:47:55 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/4] leds: rgb: qcom-lpg: add qcom,pmk8850-pwm compatible
Date: Thu, 15 Oct 2026 20:47:29 +0100
Message-ID: <20261015194732.64428-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nCbvlp3BCAMDgwKysUl_TtTqGXnO6qLZ
X-Proofpoint-ORIG-GUID: nCbvlp3BCAMDgwKysUl_TtTqGXnO6qLZ
X-Authority-Analysis: v=2.4 cv=NqZE4MdJ c=1 sm=1 tr=0 ts=6ad12ded cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=QIIdgxlFtvIS5BbdDE4A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA3OCBTYWx0ZWRfX3Y665oT+u+Wo
 TB573x8O/QyIY0+AFzI6c88FMVzp6bCfglzmKoXLz3VDBb4gdhPIzpPRUgx0I+MnJLIpetEYcWE
 xI5bA9iaVCQTZpZeQZEzs1YtTzab5Hrpy+JmrdHNM7yxIA8DEDI78Dgw3mBgdZ6WzVHWISgeANe
 pZoxqOl/k4gYQf8ompZkR0alqU32QOwPWoFjEdbubHQcp6Q6m8ocX7qEA9NlFM/anMAqNanmVty
 jCLqlNokYzXCkptfovosdEXWZdtS1nsuklbptWqdGQl9uuFMq99VT4Jc/QPhIlkLvMySi/LIDSI
 mCBN/Vj9+UQnbEYkoKoera5aM4YiFNjThv4+o6H+R6JFcv6h3BTSnqcFofxZLBjo3Zv3jU1KOGo
 fOJM/hunmhJtyaEEHWsyDDq2LFNR36nFzcFHDfn49ya4palGEy4hbteufNuiqw0ZUiG9ZJxYruH
 SnMiqgdXyfpMKPGMHdA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA3OCBTYWx0ZWRfX70MY7KexIOkm
 U6pzREwvwzNH5gEHknT0PbOFIfAP242BjnIFGtrik9bQSNSu1FkevzuzPztoLYVH7KWfpcvDu/D
 sPT7sUEquoxSwqpbWwknw+8BjfOAdh0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150078

The PMK8850 sleep-clock PMIC on Snapdragon X2 Elite (Mahua) exposes
the same two-channel LPG/PWM block as PMK8550 at 0xe800/0xe900, so
reuse pmk8550_pwm_data.

Used on the Lenovo ThinkPad T14s Gen 7 to drive the eDP backlight
(EDP_BL/PWMR_BV_PS).

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 24ffe079f221..485fa2a7a848 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1837,6 +1837,7 @@ static const struct of_device_id lpg_of_table[] = {
 	{ .compatible = "qcom,pmi8998-lpg", .data = &pmi8998_lpg_data },
 	{ .compatible = "qcom,pmc8180c-lpg", .data = &pm8150l_lpg_data },
 	{ .compatible = "qcom,pmk8550-pwm", .data = &pmk8550_pwm_data },
+	{ .compatible = "qcom,pmk8850-pwm", .data = &pmk8550_pwm_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, lpg_of_table);
-- 
2.53.0

