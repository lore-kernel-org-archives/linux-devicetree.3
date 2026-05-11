Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97263C3432
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 09:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778493533; cv=none; b=IIcLnA9x2MDufruA3sy/q9Ltt3f/6AM4AL0vqgi2LYVMC1gcMpxCqiqZQ9zPJJifJi0xSxQAurX0A6YhtAS4XHKzCB3X0BBcFgqy/msZVndMhP6xhU5wJgx5JbFtR9hZmjDRK5oAEsBvVuyecR6anGbhwINsMGI7/xXKgjKVvX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778493533; c=relaxed/simple;
	bh=Y2OjlnCuQlb1NvQcRqlakOxq6WkVluCIr8bKCkZiNNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UNxXbLYfas3ZOlqW/pp0z1KOO+DSgl80Bix4ZFaBg3079RBMQwPVcEH3AG3oXGWw+RZ+rMgqlQV2DrXJMev0Czuirwhppd19LxidQZyN3lBYBunSIey0dSYZCEBhRlJsLjW/y++NUGDyDQqAsvarzxIyUqzKJJuGnjJc2c+XOio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WfTrO292; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R71ugVG8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WfTrO292";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R71ugVG8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7Kkar439441
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 09:58:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2GyxyJ8YMHXnlmbNNr4fpkzjHzr/ZBksEYUIqB1ntQ8=; b=WfTrO292h1oyY7SC
	H4ICKr8oF7tHCFWjcH+eL0ZiE49TmC0BQpNU5g3PJfoTG2u8zWPKPIf5EYwAUVVA
	nt0cGR1qtAyZLliu/wkNcKQKtOiukarUHvykj6oScQYBdJpf9Kf0nSQhFJGyBjXz
	V8G62bC7lIXU3a8bTu1GP12w4zahouKasI9ExRrRxzLzb7uguS346OyNx1SBHCoJ
	lw0W+9ipN6Ldwx1Hotglj+Do2Y1Atup88qBQfFI5gux9derobu0yK/QQxoxjP7Of
	DBFgXdE2tVU7jr78yLxEFtofZ5dDjvUwN7HO0106vlN4ruS7JtzVZ710hb5j9cG7
	4s/fTA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1wpedg3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 09:58:51 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95ccc6c5b49so170566241.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 02:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778493530; x=1779098330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2GyxyJ8YMHXnlmbNNr4fpkzjHzr/ZBksEYUIqB1ntQ8=;
        b=R71ugVG82566FOokZZIe0slLUCGspYrGMbf1yEBNsBzg1UD17npGGozQEJid7EJql5
         CZWO1A/xbMucjV76QsFn6R+VXU4eoZ6bmJSK7g6scJd5aUgw7peluqFbAL9BYiJDPUJ8
         rHZqtIbslWc/X3eNjWPORqw6CjD9uK34KBTKcDG5WtlVvPpczWu77fqhADIjwTuYVl3i
         AY7MCzExWPklyQyHDw6woX4B27Y+SNIDfshook16oZSF8sCyPz12iKqtPNd9KF/SgyK9
         zDv6APz/EeE/AlSnucEzUaenLbnIwu75pmaH/fk0Q8jpbSkIWnsIj9IAmraNLnev0Q+s
         OfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778493530; x=1779098330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2GyxyJ8YMHXnlmbNNr4fpkzjHzr/ZBksEYUIqB1ntQ8=;
        b=AjwOJm05T5vcOgcT38QiS5qrBglT0KJVwjteQHmE4j/qeDEqTtJiuYqGlQKCl4aFY0
         nAI1iqZQDwKzc7+QvzUZSDPSAuddPwMzKMLxrtONUx8CpK1+QNx6zHBv2TH2lgRgGtFj
         G5TRqek3aB2kvM1RxSHxRWfnpCPKLv2SI36NmszIMnwPVQWz1Gjt1Y35wJeL8S27yTkh
         u9o/8Omg/21lMy0gG2Lo6R9IbK9rHWDPeHqWXVjyBl+pKrwVOdy4RDUgR/Ry9ozgEUAw
         a56u37IKXypqrG6/vdFJ/Wsqk4TTCXWGvh3reWttbMDyqs2NT5m7yZqt80/lJi37vwG6
         NAOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/4wIGhFj+7QGQy+xXSrQYNJfwlZsvWeD61t0bP2uNuV6QZ9CQFCXcgAI0/r+KvJyhxBX7v0RCTRj3I@vger.kernel.org
X-Gm-Message-State: AOJu0YzszBmcxoBy02O6XJo7BaxMqEx4zccfGaiYBFH/ugTJc1CiAYs/
	6dm1+ydvwArnLqLCzgQCZ5iji7k+XXgCLffE5GwK/aC6CIOc1NysIwyw2Wnbmh/XWXn04PDg0+a
	ybjVrDVUvlfbthneOLmmhYv/2lwHiitN1nRwMJUwZ220Lm5JyZhR34Ys+ugMFT1Vz
X-Gm-Gg: Acq92OFpdDs5xN/9QrJ0awGDMmJeGvBB7n3EITdNzqbfMmFokVNFwl4sQCmw5uOYCoW
	OLHKyLY/yMo6thkLZvSVw1D/58ps2Fre+L9StC9n7XzKRDI4aGkgFLOTqeWYjhmtiyPqLqdOlP+
	cZ9Y6GuAbHRjpR9ydmNlHiVJSUobq20UTZ/7jo39z3ZUM6rjde//Vxvv+FA+nalJAMOncOlQrZp
	RLSu75+yL43eASAYxwRz2FOY2ernybGEn24AAFVuU2skHObIXwr6uzh2kJjPy16M7fppgewXV53
	RZixdziTDoV/sFPMsSUa1F2fb4bK8Sq/240/PKyfKOK26cpADfqfq6HnFI/iwx6KiJzt9hzPzaI
	Ai4OqTPIAL/rH8CxqUXRQzrKrLhRe/mEhd5z0WQ07Shsnnuxf0omCTYZjOUMOe/4RqbFOtvRN9e
	QIvSI=
X-Received: by 2002:a05:6102:31b5:b0:631:437d:be97 with SMTP id ada2fe7eead31-631437dbf33mr1451664137.8.1778493530183;
        Mon, 11 May 2026 02:58:50 -0700 (PDT)
X-Received: by 2002:a05:6102:31b5:b0:631:437d:be97 with SMTP id ada2fe7eead31-631437dbf33mr1451644137.8.1778493529767;
        Mon, 11 May 2026 02:58:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac11b7084sm468659866b.28.2026.05.11.02.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 02:58:48 -0700 (PDT)
Message-ID: <1b32c112-916c-4e7e-9600-e2d95bbeca7c@oss.qualcomm.com>
Date: Mon, 11 May 2026 11:58:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: hamoa-iot-som: Add pm8010 L4M
 regulator
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
 <20260508-hamoa_evk-v2-6-3ebdca3e4ae2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-6-3ebdca3e4ae2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: knorD8ObvUzHgrKyz-5f6m9hr6wdhsLH
X-Proofpoint-ORIG-GUID: knorD8ObvUzHgrKyz-5f6m9hr6wdhsLH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEwOSBTYWx0ZWRfX5uUHewshothf
 t5BYOJSoIGnl4Yz/B36TeKD2GAge6nGNwQTDU2v8UMVhxnpA4s1s3zRDdguIjiQhZHc5AANEC4Y
 eJ+pumnkmZdLUq2Xgkz7YJJr4+Jv9QvcHemzJDYOMQWpJxPqMZKxvjB/UkBhBpymRXhcYat25GA
 /s1O+uLAN75IsOnj06L8NrEDfrJdWP+0KmqYRI111p+KTbs6b6KavaJfwX9G3/ccbwpMeRRQnxD
 HQU9hFXTSoIL8PYmIyU2DCR2gJAQSkyoCbP5Ec52irB/p7fxhqKqwSL20J2afKAkqpXszL1ObAS
 OGsdHizKIwV+2Z5seHXnmKB6x7Xi5VbJEMLLzVnI12WBGJuH+Pk9GMlaLbLdt5LnfA+0GD1c5XZ
 MIgzMuiUIiMiNOn7WF0kzJMWmggae+BCroh8guZdcPe0h8+bVbOpRY4IdBjbTW4r1INb972dKa8
 L+c6z/ElYuYqti5oWmg==
X-Authority-Analysis: v=2.4 cv=EeD4hvmC c=1 sm=1 tr=0 ts=6a01a85b cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=GLZNN3U5Jx1TMTuK2tQA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110109

On 5/8/26 1:40 PM, Wenmeng Liu wrote:
> From: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
> 
> Add pm8010 L4M regulator which is used by Camera I2C pull-up.

What about other regulators on that PMIC?

Konrad
