Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785979;
	b=N3fhgbfLUc6yzHKrkxEOAZoyXRygsaLaHXQOtKx5S34/X/bJ8P3oLG83tzU1iL5QftTE
	 MZfA/Ik2Xzd5aDqmhMJZS00M9fghFNKGWdlqUH0oY0QEW8Tfgnj809oDzqar5yFIoqpI+
	 RbwUpLXy3zFjNfag/+3NXuAbgW+D690E5Vl2fjzyF6Dx3BG6M7I1VlyFnjae/n6SfiNiI
	 MlbY1O2v1AB39hRR0t3M6/o+0p/7GTTJnaOX2IL+fAwEd6aGMl7M9dIa2CqqMJA7oMuPr
	 KGToaSGF1j+18CP0T7aKjVETigzvCjKkQE8hSod77uloVNmQsyBZ6JX8vgtKKQQdAvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785979;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iHRL8I+yz0kGiE+hySJDhurRqoWQ+O/WzGFuI1MAlmw=;
	b=ThoM1s9Z1oacVFV7ezpuv8B72lBR96EulQAk1noo8o8rM2XTD92/6uuAyrTj2Y3obr7H
	 LCQG7XeiPyc16fUMT2Y8DbXu40D0CiPZwYqI5TtGVJoQmxMq6phndSZq4O3kH5ijAl6KD
	 SnDCpVVkTxgocoKFlxX8Hfhr5AFs//mQQ9/IQsvfGIjszBXQt1Kp/EBD5BJ+kE30DIezW
	 4vbGW0AfXgCtaCIDmpRxWOzQbMoNyhuGA7aIduFr/re22fL7IiZhRVQwbEMLWco1TBI26
	 qFOuMnVO8POW8sD0EZ3hMliuK+2fx92KhxhzjFwn8/RKmkYgfasPljXyGQCcRYKskcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gTala7n0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IXgT2DRY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6059A606A321
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6059A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gTala7n0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IXgT2DRY
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARCh9ce2920830
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iHRL8I+yz0kGiE+hySJDhurRqoWQ+O/WzGFuI1MAlmw=; b=gTala7n01tU2cB5+
	uWdw4rRZjX40s/buTh7RST/DQvNqQZxeIR7KLjvn9b51gNUHMAOJ+5qyMNQf7frF
	POCODruCSV5+xvJDW9IpznqFYKKOPrdGJ4+QOu5rqQejswufFT+jHnzWLMqxEKDh
	oF/7nAVfA7bNXsy11cplSq9kjqD+zLe/mJhGdP26o9RvzF+lVEP+/dQlyTwXqs2+
	B/3UmXCR8mJzpqmvJDZzyVKQhamVnP3auznLs6io1lkIhqYn4qAzhll2khaUorKf
	hqXYa6kN4FiqzL+pui5EV5kur0E+Y6htRxOkea0xaz5UHrK52TzrtI/G/eYkKuA0
	CMDU1g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gh9jy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:26:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92134a35ec9so7927366d6.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795785977; x=1796390777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHRL8I+yz0kGiE+hySJDhurRqoWQ+O/WzGFuI1MAlmw=;
        b=IXgT2DRYA57QztZA8h+FOTST7UukOO3W4SVg5JVHlGEuIGvuPUOzsh6se1X9zdHECi
         hZDFcJVqpSLKA7eeilJpQwk6VhSfYMtpBGuVk6WIOKPVDVtdiQwATxq7mXx0OibfLPnH
         a4/RmtKhu0TEuLC5bUtB3HMmWDnPtnYlTik0epVkQ2EOxe6wTFyvRYv103YNUodDBwjr
         OhwAQlq0chdz6m/Vhk2jhGzKUJaYxI+KkGYSz3+vLyd89fz2TznzXyKoH8kNzp9FSs/F
         y0+3pAPdggVRF7NHWG/7o6+PVOQ8U/xaCgJnX3kVdOAQ0s4jTEs50qNdH3wYBdQrakF7
         QRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785977; x=1796390777;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iHRL8I+yz0kGiE+hySJDhurRqoWQ+O/WzGFuI1MAlmw=;
        b=XbvnecR8bcDhD8+rFsDtRLZh63QF97PgIPrQmEwT9COFgbHDCH1gNIvJWjDm7xd31Z
         9dobpuwixVf2fFSZE3GN1562nBQIIeEk1mwW3c5k2xw1KuOF04ZvxsRfmzdvAOpTAiMc
         fwJLJBActh55IHrJ9oR5bHz1cZJGOSXEcaYvEbG+DOlS93veYdMZkzDalbABRmlpECyF
         Jjk8R/yPwppzTNDrSBoLLfhMJo2jLEaPGZrsTMM1Jrn9OgR9k9toM4y/seYN+ogqgzby
         oYCGl6+O0DjasfnRL7D+o4oejuL3qicBvHd70crhhDF4RwQNebuzhZncG9t+Vw29QyQ8
         G70Q==
X-Forwarded-Encrypted: i=1; AL+hErFPu/2WJMaZc/zbQjyFlYFgu7QG7EDeAKBPvlV89qZLqBZVYxzGfsdAxswfWgF2qV5guVMz6qDAPUxj@vger.kernel.org
X-Gm-Message-State: APuU4Z84pPMMBM97b63wV9BaG5M0iN9HaG6YiZ3U1hLNIhFK+rLG7xOh
	nIPP5bEDdItIFsXmigtY7T6/ho8+GeYRHIwaPnFvQlVzaTifgizzaQA99ZQAKH8EEsQIlc0nvAS
	53yax2lMOA8yLq+zZ0OSKW6nXlsYkB/FV88+0UoywPp9me54XdRjsE50L6sh0wxq6
X-Gm-Gg: AZFdTZezRsnRr+F8feAucguDp1kbuWrBNSIk53Mng3jpP0O184XzsH5hZRjVtjt8qDU
	KRA8+rdCaywNXNlf2iTnIX4zhw33dvmFK95DHZMZ5GYG6xG+4e4aPOB1/2q4HyGL+PsX6S/iWj0
	p0yGucZrb16sY/m0ZD7E3JGXs9HpF6jf19NSyFx3EDPNH1/LHV7BlaFWTmVQLEapQlVs69WOVSO
	wskeQa9N4+G2mN8k2jBOmc5yBbfP3AhJswx9sDAJTwo3l0DCX7phYDVtIyfSu45nM18sFU+yuhZ
	2SK4IFlL9CCmKDAiolnAhgrX81e8ZfHn8gDfWP21gspkV9A5vtiu0LS70VZ94+GBkZRTOsiApoJ
	lMoIxt34Wq9N2z7Ycfg+q76kZ69HvMcN+iS51Ac+QPQ8UvlcR66Dg/c6weqkRG8Y+NzwDqPw=
X-Received: by 2002:a05:620a:a50f:b0:949:a6de:cf5 with SMTP id af79cd13be357-949bab1db0amr4555765785a.5.1795785977638;
        Fri, 27 Nov 2026 05:26:17 -0800 (PST)
X-Received: by 2002:a05:620a:a50f:b0:949:a6de:cf5 with SMTP id af79cd13be357-949bab1db0amr4555760785a.5.1795785977172;
        Fri, 27 Nov 2026 05:26:17 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aec5115sm856186866b.51.2026.11.27.05.26.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:26:16 -0800 (PST)
Message-ID: <1bd90d60-8f5c-492c-8d82-71a1de995a9b@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:26:14 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] clk: qcom: rpmh: add RPMh clocks for Seca
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tyler Baker <tyler.baker@oss.qualcomm.com>
References: <20261127-seca-clocks-v1-0-1781298e658b@oss.qualcomm.com>
 <20261127-seca-clocks-v1-6-1781298e658b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261127-seca-clocks-v1-6-1781298e658b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1MyBTYWx0ZWRfX37pTr6n1MpaX
 am9f1bNH/lcnAfy7RthGvlauGhDf1g64PbFIJy60GL7BriFZXVske2xCeIKUrWfovFQm2mXeYYM
 PjAXVLgt3kr0SeqNvuFvAktbqVtrgiE=
X-Proofpoint-GUID: 7aVgtD9qIUCpXDpeyvvJJHQF2kshHF1q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1MyBTYWx0ZWRfX1JZnZA+x+gtk
 o2fNHWJUppEDia8A+RS93NcEFXxav+bqw7ckooHnlgrMp4m1PpNaXCV+cd6OcXyDjfb8RB5VNIH
 U0Y3R2AAazyeyoUhMUrA6ihc6gYKd1rDekg2cF5H2vNdb+j9ab2fF0aCQ0js0fwl9dQCk6a7P71
 /G4hB3JAnAVNd1+mD+uvSmS0Cene4OfxJFWJOUTX/nmr+WocqaDEhPGGoQa3Gh06HUwfacB5BCm
 hZWJO478Bzhf0zWtyylsz5l8FW8l0eU6brDrq3Mmux2l7gjLjJFp06CCK2Of1IwvUm1d5GdDHnH
 pgRtM8D3b5AbFLuzd9etru+txsQdCNEbD+P39Oj94xK1DtbZq+T6QX0TrtRnf6aqvdY9aWodKqQ
 82RqBpVhgfopYBmdvpoyup0EzKynFbgBf/H2bGTSqcXJBWxzh/StYGXFAgIPiF83+0OeHsmFTvH
 yOv47L7wY0CpDwKWTyA==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b0984fa cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=0_OSfFgOA50T1ex7QDYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 7aVgtD9qIUCpXDpeyvvJJHQF2kshHF1q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270053

On 11/27/26 12:41 PM, Bartosz Golaszewski wrote:
> Add the RPMh clocks present on the Qualcomm Seca SoC.
> 
> Co-developed-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
> Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
