Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B2E3D1CBE
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 06:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454436; cv=none; b=nIZFaMU0Njn2t/B4f0/x6HETPygivWfkUOH0KCFOqyKWVTsu5kVhoySgx39TSp8RxyJ/ZwjprNOiaGIdqncygp5JuTyKjLM+8nwEIW9RYzlLJAyemGXhZQ1/3WuUiqOJwS5iwfeeGPSfynzl9q3yjMpTD4V0eZ3cnuC1LfBksA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454436; c=relaxed/simple;
	bh=ptQk8L8RA2taHR7/ACa9KdK3UZh3scbqr6ODN/ehC7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oedjBv/uV4o1hFCVcjtoPgwfb3v84KuL0dTkjOwknYiCNrcbtp5tNSat3nWX0snkmaqfE1+NVcjtyTpP7KkovK4n3E+Mv7R70kHKDz2+qc74v5tOCoSAcGv2r1EdpduOexFC4ET/4pd6eh49qB10yQ1YuJUUFZeHuwM1uia7ELs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jc4YnbZj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NEh5XjFi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jc4YnbZj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NEh5XjFi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q2iYGU1169727
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 06:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5oaO6nlU8yDgoxuX+c2jtK0nD634i/BWQxbqSO1tKcc=; b=jc4YnbZjP2CjuRnd
	0UoHCGpJlm++bQFF+SQmmGbcHMPgeIeHbhh+cFhoSBoD6dZp3ZzO4VM/ZvPjPANq
	uW43i8pdk05Mb3G9+RlRiahKEc7x3zIeGmYGZD3d9DcH9czuuL3cEpHJ8fzr8y00
	m5Kogkqszc9YaAEW/ri59D8ZqtyPHRkq3n45D46jBrRhzlkRwOM9V79k7lTIBCxG
	lfkkBZgzgnBRRzZtO7ePF6n5rTe7equ2vdlRrA7OjYQUO0T44MGarAu3rWVkSsva
	5qILNaE3RdQPP7UEGp20uQIgG20BmkBhIYnW7+KIdFrSjl3AmmWfcXLOul95Q8AS
	AO4heA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fgc11x4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 06:13:52 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30ca1f74cacso163187eec.0
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 23:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782454432; x=1783059232; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5oaO6nlU8yDgoxuX+c2jtK0nD634i/BWQxbqSO1tKcc=;
        b=NEh5XjFi56xfEkRFcSFKwyNbNDHd38c7Nu6OXnm2YOtfzR+05yffUWJVf72xN4QWfi
         JORYoWoY4mi53rPg9NbC35xxxu0VKYHEDnIPq7Xm5YgmHaNRdQ0rVLoK2eMdc+CYlPeG
         W6Y1AxPbbH+KO8YAk9g6c18pyCdlaJm1kyLOZWI73mH+G0J1m8P5OvciSjP9akx3Tlzi
         lb5KcWfdQtUiwUSey0XKCsrM8SrvI2/G3dpzXBO3Dflq/j6cpmM7T0dc0L8etA1cFXQ3
         2n/BLJoELI4JEm+hN9id8yFLKH7Hycm5rz3+7W3Yad2w3dfABwrsF4a8pgZ3bqJ0m8DL
         QsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454432; x=1783059232;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5oaO6nlU8yDgoxuX+c2jtK0nD634i/BWQxbqSO1tKcc=;
        b=jcwrp7EHPrbyLS+0LEL6HcEgMk7nfeyvhlSNrdr9HU/HyRBY9ky3zBTKw0x5y63ABl
         ogX+2vK8vIJWhVE4sLIrQemFwsUeLJrRELTOjcg2RA3eVVztu+9MDPgX/p8/xjadU9qz
         X0pQjpbyDgypI2NzI+R807wGvvD6DDn9TzW5MA8J+4MYL4k31m1eHLBzotLNuP6CXGJX
         iGpx6ltuwkRnuRtdsBQJbb/L+WaVu64XhsBWemyFFjgGlu6svGlpWfzXv9ydB3tUUQCp
         Pja8pgOwRXEhRPgvijU5FB4HEdxTIihQvZVF5GQuGw0UsDAJwmK0qKDqb3Szy0oWEhKf
         blBA==
X-Forwarded-Encrypted: i=1; AHgh+Ro98WKP6yr1rH+XepIq2WNqPjBMba4VuWbNU6yZtXKRTfRtD7Y2xrLMjfGqDzi4Pn6woTTm86rzeKMg@vger.kernel.org
X-Gm-Message-State: AOJu0YyQJevPc3R1gWOliwW/4Wlp1tJEO6NydRyvdc8wDNJ6aj2eNsHC
	x0jKVM8KveCUEIhcz//g6wnGt/DUZmP6+/L2xsHTx+DCc0cuaeJRu3gh5UZZbigZzS17a3615BY
	JWFpKSQpiv5kc/tpbsLAH6CZ326d9uND8lnPRN4kEY9vA0scJKaxmDABDYiya/dt2
X-Gm-Gg: AfdE7cnPztj3DVWfcsTyfPtuSSxYEnbazWu3BdrHukYfp9Kz+8M5OMceEjnsSdzVRaa
	stErPdscnYwlKSJWihks1hLkAOjHX1dIwKPAcArtEXVnlK0PX1bvxNQFCBJWEPJ6LbMsUnl3mZ3
	jWG2MqJUff6N+KPxb8sUqyvEqI/mV4pKiC72UMAtQfvYD3gcxzSsuJVuuaoMoKWLseYo4jgXCvm
	ha4dMXWbmJjFVYXLjz65+fyMQfqbrNDJBjLF3mC5cm96E9251Ba91j4NQrrXztp3toc2TznA4j6
	GJoy1OAKAnOrd4eVqp/8qgYRLBjaQtLqypgkEqd3LwUe5r0xpE8fpOT2rSGVi1MyFAbfGcoQGm9
	N6AoYBLrLaDApb12SvRCwQxsL
X-Received: by 2002:a05:7300:1488:b0:30b:ff0d:1efa with SMTP id 5a478bee46e88-30c84d9b4c8mr4532527eec.24.1782454432180;
        Thu, 25 Jun 2026 23:13:52 -0700 (PDT)
X-Received: by 2002:a05:7300:1488:b0:30b:ff0d:1efa with SMTP id 5a478bee46e88-30c84d9b4c8mr4532498eec.24.1782454431566;
        Thu, 25 Jun 2026 23:13:51 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c9c456cf5sm3782007eec.2.2026.06.25.23.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:13:51 -0700 (PDT)
Date: Fri, 26 Jun 2026 11:43:43 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Yijie Yang <quic_yijiyang@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/6] Additional regulator support for the Qualcomm SGMII
 SerDes PHY
Message-ID: <aj4YlxJDvIsaJF1R@oss.qualcomm.com>
References: <20251124-sgmiieth_serdes_regulator-v1-0-73ae8f9cbe2a@oss.qualcomm.com>
 <CAFEp6-3De6r3XwSmnKpMSSf8KK3K-esDAhTRKN41Bng-Yf8dXg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-3De6r3XwSmnKpMSSf8KK3K-esDAhTRKN41Bng-Yf8dXg@mail.gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA0NyBTYWx0ZWRfXyWedvzWeV7fA
 Kih7JR6sHG2YaE/RDlYljwDaBOwCcPJdKlrIZu+S+q+yI7Md70l0SjY89x7oEcgNqP54EMQ1QoK
 CG92J0PUGRfz7JDZoaTA6T9/Ok37h2A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA0NyBTYWx0ZWRfX32nJt8ErsP7h
 XLlYtlkCjDe2Dt2Kduu/EnhKoMJDPa1+I1m2UNmSaGWQcYmBbRUlr91i+l4tbqvpuyiC3gGFEi/
 lD3IPEifyLl+k4A8RW9c1CLNj6u6XMOG0kV5qF7Rq51oUSVuCw84Ua+dRGpKcO7MEtVI0/BfeX8
 WfQDf7EuMmY9tEU3jprc85fOw/9JFjKRPPwnmOzM2dSdUwqSueMFmKoxD3xfA4C6Kgo90TmkRGQ
 YEtok0SsGXPRS4+4Bg1RlNrJeEIfzjL2hiJgAShTm2iS1tkFBRtmdyy3QJRGU0Qb0AJlLmGnkj9
 DtH4PP/SWAibQLqOpJ7HsDf8YvqWSu2nUCeflUZvgZmABZeXuhQiQkPPgDZcxnWXEeCijxWoZ9G
 rEiR5nAE+xvK1VfKHSiO8SETLNeLIOYa/wThR+7VZ0Qyo7k8X+5If4umW1gdczM4kHlLJOHpynk
 8Ea7FALRMBqdDBE8okA==
X-Authority-Analysis: v=2.4 cv=O4oJeh9W c=1 sm=1 tr=0 ts=6a3e18a0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=evnvvmh2EKmFMqWf2KwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: QIudzVNGcwiWEzBTt3jr2wxiGvhGWDfZ
X-Proofpoint-GUID: QIudzVNGcwiWEzBTt3jr2wxiGvhGWDfZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260047

On Mon, Jun 22, 2026 at 04:08:55PM +0200, Loic Poulain wrote:
> Hi,
> 
> On Mon, Nov 24, 2025 at 10:26 AM Mohd Ayaan Anwar
> <mohd.anwar@oss.qualcomm.com> wrote:
> >
> > This patch series addresses a SerDes power-up failure observed on the
> > QCS8300 Ride board using the phy-qcom-sgmii-eth driver. The issue occurs
> > because the SerDes PHY requires both L5A and L4A regulators to be
> > enabled during initialization. If either one of them is disabled, the
> > status register does not reset, and the Ethernet interface fails to come
> > up due to a timeout:
> >
> > [   77.105651] qcom-dwmac-sgmii-phy 8909000.phy: QSERDES_COM_C_READY_STATUS timed-out
> > [   77.113447] qcom-ethqos 23040000.ethernet eth0: __stmmac_open: Serdes powerup failed
> >
> > Presumably, the issue is not seen on all users of this PHY because both
> > regulators are often shared with other peripherals. However, the power
> > rail schematics for boards using this SerDes PHY show that it is
> > supplied by both L5A (1.2V) and L4A (0.9V) regulators.
> >
> > This series has been tested on the QCS8300 Ride board, and the reported
> > issue was resolved. All Monaco and Lemans derivative boards require this
> > new configuration as they use the same SerDes PHY.
> >
> > Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> 
> This appears to be a real issue, but I haven’t seen a new version of
> the series or any response to the feedback so far. Could you please
> follow up on this?
> 

I will shortly send out a v2. I got access to more details about the
hardware, and it has two dedicated regulators which need to be enabled.
The same requirements are there on all Lemans/Monaco-based boards.

	Ayaan
