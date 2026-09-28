Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D36C471D0B
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 08:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583817; cv=none; b=WCQv6D2V0L8EyyhO1y2kwLv4y0zhEzpbbKRc8W9gJ+TEDUdkQcJJ+3Z5GT0ox8ztQ0ugIyjWbWj4Y/87Z4blQtxLe3Z5jnktEqy5PyvPZoQ19QMKNKDDlwmpSAyBLBSvDyoueZw6Kf/5D1UN6QYrXCk78li2XB1kZksslKx0Pqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583817; c=relaxed/simple;
	bh=KEk8M3Jr9bOSMMr4JBrAPiz9BZKVvLlMeEqrlsez2Fg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jYyjHZOCbyLmZaP+sUFN5J18WLKf5AUvrWyjBrtvsxAjs97irQLcuTZZU4XwZnOhoL4yU9p17tvhjFKS6MmKlIhj0kFn5m2yQG/vd96+l26CzS8Bd7Ja6jblHhmK9V9GKD/P3sRyJ8Eoy0gkavQd3kJhdpfMjcrPWCwLjogMo7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=juAAtRwe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YKZAqTRw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="juAAtRwe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YKZAqTRw"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xtnb361445
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 08:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KEk8M3Jr9bOSMMr4JBrAPiz9BZKVvLlMeEqrlsez2Fg=; b=juAAtRweENLBLmQl
	+ERIaFv38jDpKH+ICBdAfD15GUU6MRom+B600xtPxx5fqSqZaWt1Uy/I0oZGBOZZ
	7wkuxzeBpNpHsvXLSvzbk14ENd+41hpnYr6llQ6RJzBZHwwWj8AktGcrPXHt8QPk
	pCWQj0h/BmA/DhKvBdvuA48aKs6BXeNNlEI5GWIkdDghbMLrPi7pxkQICDnwvPGz
	i1h31ekTTmYEkHqIwCN5y5F05IkToNx5o4D0hGF49uVgTAaaiacOi7T9Nil1LGfD
	Lsph3OvkYabzJjsNp6+48X33NzhxXjyoq847itdW6+g9C5dM7U1G9ll+kf0JFfpZ
	zDZghA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav49h2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 08:23:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a0312937eso374034485a.1
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 01:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790583814; x=1791188614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KEk8M3Jr9bOSMMr4JBrAPiz9BZKVvLlMeEqrlsez2Fg=;
        b=YKZAqTRwxjR8SQgz+L0gPGn3ebMErxD9xVB5mkRTk+vgDfjMRhoVmp0AZS7z5grxIC
         E/brlVP81rzUY3b0JKizWCtETM5y9yow9qIFaHeYjPNokHwZb7Txvb4rmgW9l9iP/8pY
         L3A/vhXIMf/G57Vj+QM0nIyzzgcGjEp+HNYtA22AghLBVIYZJ+1/eV4BRDw0AISRMeJP
         0lY+pA9m19vYsj20kOmu40fdXWU6e4jcr6yibNXCf/MwFF7jlYVccYQuZNHV2MusanSd
         bILdcgzOLUKwmEqoqKq5we+W6QyWrzT36BLrDZyhEZSRTRU+eHVcCm8aHFGj45OcpzXW
         znSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790583814; x=1791188614;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KEk8M3Jr9bOSMMr4JBrAPiz9BZKVvLlMeEqrlsez2Fg=;
        b=jEqaHgQ30eHbURUr789ogrjXwJaSQX6OcN6P3A/guQ5PhCydwTK0I/m/8dR3gOZIy0
         LFcZeCWEvaigGOOOrTyqf2xIatNP5cxchWTfaxKwJcCDlEODzNEu7MpieGahJmwReChI
         9pIIcsOd7HRk6LV+KQ1B7yWiEK90BgFoL4wc9SPBoupkCnXQ7r1PgdqS6czgk7ZWUhY3
         oene9JMpEp7HyRXi+HQKOMwV53t0nC78/8ra3peqnKYANEfnzG7E4UH4tgbzHBeTzS8h
         dXiKu1I2Cab/YMNr1Rwh0IeI7h27T9AM7OSSqDBOJQDbT6FcNy+OefxcVnzlnz8dAXou
         VKrg==
X-Forwarded-Encrypted: i=1; AKwUvBzfg5LrJtzNi3sgpak72uuLWAIRlEXBxPdhe0IpGShsJivrKiiRNkWaqIfg9XuVrfQdajL4Wjc2q+ch@vger.kernel.org
X-Gm-Message-State: AFuF++m4G2RbIKrDMjJqns2axYcIdpmp1SnZtly0WUmolPW5a2zYsCoG
	iVDAN2Z09V+lGOOfOWT6uZFIac6EO9j/Jf4U7B124C+4IdyGFUNMEgB3fXYGt7B1Y/k1/yHo0+I
	vN0hAGILOc6JIlSDARwnp4hqOd8Hxw6NLULiJMbNg6rBoYO8Bqp8AdFZ72/1UZ4O2
X-Gm-Gg: AYBFou1lVAeFyfVLXlkNGJGzTygwkWrakDp/EKUJvrR2r4TAUX96ulpHaYwZSqUzut0
	Ki/2eyquoANZwUrxH9ppj/1k8dn+qWfgnKMIs3F7XJNQoGtrBss/bbx08dTW4vb9lZnKPuKDmeg
	Y/p5j+CevkK7FThg6ZiIvfWf4h1s9cMYU650i7sKV3XMX77z5ePqB4xkeWYzebwDLuBQKiDo/mB
	gvoC57K1j8Ve42Mm7O/Mb8CqbZvQhPZK2Q9yXujauYs4H+Sio48yiH9hlOHk/RU4Xjben8RZgjG
	dH5qcnWhAu2H1Y2N9QCbve9qEzW7Y7FOD0biwDLFV3rij8p6pGmDe3xdgR72WhPv9CbOEMpv5St
	M1QnqmJtmdoR2uXgtt5sM89xml2x3
X-Received: by 2002:a05:620a:29c6:b0:939:ff11:5328 with SMTP id af79cd13be357-93c43bf14dfmr1902392985a.24.1790583814455;
        Mon, 28 Sep 2026 01:23:34 -0700 (PDT)
X-Received: by 2002:a05:620a:29c6:b0:939:ff11:5328 with SMTP id af79cd13be357-93c43bf14dfmr1902389185a.24.1790583813905;
        Mon, 28 Sep 2026 01:23:33 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a007fd1a01sm20537165e9.0.2026.09.28.01.23.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 01:23:31 -0700 (PDT)
Message-ID: <27997939-f39a-43aa-a287-44c9f70b8a51@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 10:23:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: spmi: glymur-spmi-pmic-arb: Add
 compatible for Qualcomm Maili SoC
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
References: <20260831-maili-spmi-binding-v2-1-37a25ef3921c@oss.qualcomm.com>
 <31a59040-bb20-4cb9-9dad-a62b90a16c6f@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <31a59040-bb20-4cb9-9dad-a62b90a16c6f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wovmQs_fTwXNxjgchMXxXI__euNrMtZg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMyBTYWx0ZWRfX/iIbjFOChGV9
 Wa7v6PVweUmwsW6tQKSHMN4xyzomtJrQ5MlIi/tawugkWbmZDWl92lei7HmKdCWAj82pYx5oXg5
 tOm2KDV/NBm3p60HAVys05ouoL3E5KAxJULJJYbx5jbk92efKTEOqNxTm9ghEuqUxkrQn7f3hOT
 JOIi6DhpOGWzct2q3yWEOEUqlshT9m+hqMSgpr0eJ/koXQzM9wiuGGuVViZKjDZQdQwIrvWZNtF
 lClWE/87sEK5dAsTC1unYyZ4pLzERf7yb1aGc9R9slhQ24vp4gULgXFWIEOwJUPfWodySY8hagx
 XEceO6VaflC6cWndezZsNjFnshe6calHWYed9BNPkZdDQvRBsOLEzwJvcaQUk5cG52mnHmU35wL
 vLlXMmQl8+V2t9qOgDYsyeU9PUHNdf3qefNQ0h00YtyVi67ot/GeeVRJLg2ATTFG8ElOZJ5XpKw
 nd/rYLzQQylbCVbfXxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMyBTYWx0ZWRfX8dg0LSSlYUC+
 W3NSjbUI4nhTSv705zJUWY1RIVHOMiIQcExX/uJw6nGdiL3mUpo4hiiPovaLSyYGViI8NfkI7ZE
 OhTucMcVWdNPmZCmkF9rO1bC4GFpljc=
X-Proofpoint-ORIG-GUID: wovmQs_fTwXNxjgchMXxXI__euNrMtZg
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aba2407 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=eawAJn3Fff_qTO2XkYgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280033

On 28/09/2026 09:19, Jingyi Wang wrote:
> Tested-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

NAK

You cannot test it. Otherwise explain me how did you execute this code.

Best regards,
Krzysztof
