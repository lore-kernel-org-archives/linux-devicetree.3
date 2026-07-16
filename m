Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB61435AA9
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784221283; cv=none; b=hYJDQt4MTg3lyr5AlcpZ7STCTf3L2ZlsMfaNrgwQdXHb3VJCS60U7VVjKB14yloWz66QY9vEWdA3Ibcr0ZmPV/n0dh3VShAbRhGgGpfoKDmsGj3ArjwEsqtxGV8ikZzrz89AKl9eT9epjI5psPqbilcMfxmkJ5zn4MHjk7XmWeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784221283; c=relaxed/simple;
	bh=eNPh8f71BTwKPl2FW4HGuI+1FH+v9OdACmLxafup35U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s0AXhxNStg6obW6vqsm6aTgpvv5+eIkHyoqvZjgn8mWdg872/6PRwuPzjfulsiAXTGlbeL1tUAb2Kc+BKT7R+5BJEMvjMrGJuGbbPSzj0Tw9f++Lc8/7JxVC3NIv0scQXn//VKKJ3WO4S7iB5OIWXzkUjVy480OGzuwFqz4e9Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fKh6zoiM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ijFpB780; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fKh6zoiM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ijFpB780"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGSthq3387668
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mk/w3Wle/HBMkd43JQnX3aBJd7OcjFIPJCl0hhFS0l0=; b=fKh6zoiMAp4uDudZ
	nT+Slf2LnshvFDZrQP/xJpFsoBzijJr1baRoZ5TZF87nYAVG3m4+aCbm1Uze/zxG
	z1TtXC3iwu1HkdBvRXhqiQhyws1ZIYC+gjZ7MxwdVPO0ZXc6RBQqtO0H53cAfsxr
	CsOIBF5SocOtWwU7VE3GZafYNYfoZPqtVyGp/lIbzHtq7VMPV8DO3mwF9CNzdkQJ
	f4I/EBeFizdyYlniNUqT0BHInU23WyMIFBqiq9pbQFECx9fYfTw00V3MO+z04ifl
	y9gHHj5V5DVcqhqfbfzGvlnVqYFNY0vx35+3ob8d4EEeywoIVmafgYGidSk84gKu
	WhTHPQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fen4wbpaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:01:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso139047585a.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 10:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784221275; x=1784826075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mk/w3Wle/HBMkd43JQnX3aBJd7OcjFIPJCl0hhFS0l0=;
        b=ijFpB780rGJuy54XAhAXBge7/petL03/gV1S/Z8JskxYB07vD/ELl9cGln1+dsWVo0
         ODCallQFY4j86Q+zdYFB0J1IxZWR6m0aZBQuu2Mmsfb9VhapNSNHY7+4OcIfywDpgQwB
         rstvtfew5BeRwYxw7NSNF9wZVN9ewoOUxpt2n3hatOaCh+CaOlYh3QKAMoLJsGSgZmeh
         bxtn2lhW53OzvAYimbE/NubrCaRcbAX35+2tFe79eSwrMdrFMgWgCglJazJMqG5f2Z6i
         WFz+8yzTR5Rz9JlHcddxOkjK5ZXWHxn8Vvts82gFIcOU0Z7MrDuAX3OgJjB/kkaYp2ip
         RVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784221275; x=1784826075;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mk/w3Wle/HBMkd43JQnX3aBJd7OcjFIPJCl0hhFS0l0=;
        b=S1nFTfbg+FoDzoZq/HvVunCqArHo01fsMnUD/iZCkcFE1QZXSM6V1wX8ksJvwsr/eN
         QwGmef+d6fmXzJ+QYZ4GHHPsI7m0JMXehPJt1QeYbsFphjcZ7Z8IXp4niuudIgRjWA3o
         LiWq2Ef5jq+HhmX13Xzokgdz4/mj63LBa4HuEHYWewQOoi1Lq1MIlgnFKDbw4RKpvWPK
         SJdAUIgI/2G4kBAnn2HvknL/fvbXIoOO/5ynmZuBlGDFdwluhdt0KP/Q/Vw6PNM4/7sw
         ZfiduTaadNsDP2l3oV4lNe0pe3MR7hrJnbDs7zGj5UNMbUYrkE/SjDa+7+jwVVNC9A+F
         LwWg==
X-Forwarded-Encrypted: i=1; AHgh+RrFarZH7lK5TPfFq5/ZilMl++tZqmxrrFL/8ZZOnMSlzwuJEAy/fqTw79KA50Wpg/8g4tkmMCDPL0Ne@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1hpDuzVM9gxPxEJ9egujMPU22GvC2WjCMJlSh+cvLAFgSx+fb
	GbGEmzWub4H5c6yLsLYZ2iudMbBwMc/pQ/P/5wPILs77yXVhxHDt6XD/PPkNVjBrprm2AneNhN0
	FWhya++NXX3SrWbj8nkdWC76ygnxN/gYKJ6GBt48eUHPgpLfBkJ+NuDiYF1bEvxkkpMIxd5Gr
X-Gm-Gg: AfdE7ck6tF7JwK3XjWJL9T8jiWe18ymIn1R1HlcW4GvB3Yn5qm295sIm3GIUwOfeBWv
	JNmNpQmpyTau+l7K9IGYwikvIe2iGGMy5mFz1CESZ6p6m06BGJ9mJLRVs09FtUaj5n1WVbYFwWV
	nh5OEtQeVGByr8FO7hyRL88jDXtIG8h5R9xaScn8+t8sXnjflyiEVxMRS0fUz4Yx1S4eDIrLARm
	vUTSo7Nep5A6zDNH5EeI5B4p42dCGypWNeC/inwoftQB8+uSM+TPF1QYg5+MDGoK1QgbaacsPHZ
	STvDTVR8hItQX0sPpqyOdzkeBztPAoxZ9neYNo/Pq5GP/U4icWmDCT7Mygfvu9bjMJMlqYBxn+o
	Dn69pNbIdvY97HKlGJJzeuK9c
X-Received: by 2002:a05:620a:371c:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92ef29b64f2mr1980670985a.0.1784221274847;
        Thu, 16 Jul 2026 10:01:14 -0700 (PDT)
X-Received: by 2002:a05:620a:371c:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92ef29b64f2mr1980666085a.0.1784221274282;
        Thu, 16 Jul 2026 10:01:14 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd2937527sm5023777a12.20.2026.07.16.10.01.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 10:01:12 -0700 (PDT)
Message-ID: <1e418953-edaa-49f7-b76f-99c91b047207@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 19:01:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] arm64: dts: qcom: Add device tree for Nord
 Embedded variant
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com>
 <20260716142605.2398433-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260716142605.2398433-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PsejqQM3 c=1 sm=1 tr=0 ts=6a590e60 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=v7-P37dzpIxSXi86kssA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: dkC-w5JAt1BEbP5VXJ12o_EPofGS6pbR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE3MyBTYWx0ZWRfX9kzH1evYoBYG
 7MuyG5RO7fYr7+0a9DKJlMqgmimQk1pSQbzeX2meY1hJXPOHKJTG6TsTkOuUJ9XgV8YzG29Bz6L
 ZQujpBritJ415yfA1QJSkIVLBOsR6T4=
X-Proofpoint-ORIG-GUID: dkC-w5JAt1BEbP5VXJ12o_EPofGS6pbR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE3MyBTYWx0ZWRfX5HSDJrz6JZBu
 UJ9w9dNJ8+hhuK5kjMI3cjYorjOezawtMVpTY7Z4zwG2o45klGdp5xl0kIkwCeJYSGXnjIETTg1
 58xYBlvyNFyHm2RUhJnFOTrrbEJyCWtt6/gebhDtW1ppetkpu6Ldr7yPbCzq7yX0qvzklMxgiSD
 aga61/aepGOTyUuP6x/YkdY0szf5C7Cn85vd5Nix8XaJvJ2Rj6IE32lQyGEaCDvTU06fQZD9R9V
 TrQWa1SLQ+muwjhdunPm1LeUimUQxPB1MEnEkGzIEm/5074UjkQBTGtf40Vdi7lGKCqjmxADFa+
 sw2+KbcpIfiPhAHo/UgACtCm47yxGe48YUcvVaEI9pfqK2Hktw7b7vBE+vPAJzlzsq2w/JrOXP7
 tEkvOae6X00AzlCwsabFJbFDm2N/+oaKqliikITAcQdU8fe9SBheiriADbx1NB+aFZXdzJ2Xjgy
 XgO/RC8zt+LwM7j8tfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160173

On 7/16/26 4:25 PM, Shawn Guo wrote:
> Unlike the GearVM variant, Nord Embedded variant has platform resources
> (clocks, regulators, powerdomains, pins, etc.) directly controlled by
> the operating system. Add a separate dtsi file extending the existing
> top-level nord.dtsi with nodes representing these peripherals as well as
> describing how they are wired up with the already defined components.
> 
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

