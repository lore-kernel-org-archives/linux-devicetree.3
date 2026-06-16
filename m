Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47E547AF5F
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 16:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781628627; cv=none; b=oLjbNImLg0+p8qFCCA3A4ZeMCeK210/7uN5uvRUd/Shwf+0MC9lHfpLbHJQktDAxsGukEt7OUNlxuqC9nKX6ZMF31W9IrHGbYbpAL5G+hIMZhZ2SiUtwU+NYBBkVzTrt/eMCQnfsK0YoA8a0TIC5BhUv4Lq826KrbmRqbc8IiB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781628627; c=relaxed/simple;
	bh=IeLUcKceMGp4R1jgMISZkNO7RSur2PrOa7F1GuYJITo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISTcehCo0q9hcS31mwOCSTUIdP0lKJF9jn8GO5nN72DTsCowiGCViVVtxK8SOpoZ22z6D+M7E3VrN7l1hn7DcT22Wwv9N10ZPG8ykff1B3cefZwBTILAOXA1QdSLe00x/kKtohWrHG9i4cf4EzV2pOiodbfWl7/KhYDRPlDzw0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HBcQsOmQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PxUkZ3W9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HBcQsOmQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PxUkZ3W9"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GFfHkv014664
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 16:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZOml+89Fh4slDZjDTDeUJgvR
	UxvqEHajVZitLYJCVjk=; b=HBcQsOmQY8YSSYu1Pd7AolxN7wxdOV5JaMmftSza
	1HmnymCwzB0EcCCZ+JHWjGiizsEHouhQPLgJtBorYRsBceIJMn/PdvlvpI/T5KqN
	3AbZMx7/dLKqnMSFkgyOhbbDaufPuy4VSJQNwYKOatlJuZMJUx6VC1ycTewcIuau
	ygQ9FUD/2J52U0O9X8Wku9yfzKGEnp9tumOCHz9H/uujiWMm/gHp/5CGLoR/KSr/
	xaDWJDrdvOsZxAQPnfxJOsH6bzoKNpvIRFDf/gTy4C3JMhSj1EKDnEDGV+2jOvDS
	s2moZqVXkPRroWF42OTK0RTB82EKAbFz1DQCgQWAWcjHyw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu4dkhvj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 16:50:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84245e2bb00so4235122b3a.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 09:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781628624; x=1782233424; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOml+89Fh4slDZjDTDeUJgvRUxvqEHajVZitLYJCVjk=;
        b=PxUkZ3W9pVQyvuiHsXTqube+ha/EBv1GRztZbo/wKUGWW2/x/G9cm+PznGkcQODYU4
         ztZn7rNG8ZTr0NQWyX8z2Qn/UVpbEDZ55zIlUyLKG0kHaC7tmSG04+xH9P+esxdkaPnb
         mbvS01TxsI2wOVE3cBxUA/aLot0ORFRsiv7NZR5PEg/CK/Eyfm+CG0OHwZ5hfqZYVRQJ
         q6mv8QzWCgBNx7axmWsaARY6w/XG482B0oyUw3bd/MP5WCI5ZjMFfecTdlfvJ5ZJxYkM
         Tw6oWGl/yhIn6qQF4DYKuqZCgQdQMHKsZDQITb1Yr90AqViQGSZFHY3MJJt4CSm77Lzl
         u7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781628624; x=1782233424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOml+89Fh4slDZjDTDeUJgvRUxvqEHajVZitLYJCVjk=;
        b=E/Hed9FpZQSFDKamxmC74mjEwoay9T1GHlnCe1oJIHbLOIa4/pyLiLd1D+/SwKshV8
         9kSF1HtD6AQHpWbSf1LM4E1lyuMyDGnn6rFEllcPvDGFh7esc68JZ9YumueCuLuguk0g
         wCqiF5qoS56sZdhBEXg0/PmlDBwQIbudbRtSrA0MT8dc4oqQwpxFAC6HcJbFKJHazUEV
         Egs8g92grJ8VOu+R+qLDXFsWOqwa+lY/lLIL/2KcTeY4ncG2/iWYmtLKdQyA6aTcK7tO
         E3dXjVwv9KLb9MjYt1lSm1HWNIu5YEdfBVjz+0eOK/prjWLgq5U3kYwjWAo1EzvP1epp
         gVOg==
X-Forwarded-Encrypted: i=1; AFNElJ+lxeno7UaSPFikic5NsdiamC4owMcgkNjHuOs95MlJK/c3a6IQR7heh+Xw18XYBtYEIjL8YBjQsTkv@vger.kernel.org
X-Gm-Message-State: AOJu0YweE6TLcyZn5vpR0eBAQzW0gJiw26PuaLbiuD8swpwczaECcctY
	QUy/SoCJMUhdvDHhO7w3BMvcNsIGgGhSzKd/Cryr157GUZ0Uf87Uat8n1a2el2yy78QyX6RyzTC
	cz4DqaDYNkhczJOGbNuSSKQT8aqZEPfsMcmkwTO6nIGVjM1+rLfqbns54Jlhrfbgz
X-Gm-Gg: Acq92OEEH351OgoVG3eSVJDc//+5we0vZF3ueMcI4aitPxvgoIEPF2NLeh1x8d3k8tc
	7wkt1qSIItBLywRGpEOHqNdHnz3clPBpinI9yeY1T6++T1pz9CfUJwBbZQWb50W/ppTb6ShZuu3
	FyhjyM6T0mey+Ky4jpCuNiylTQuVhSrR2WsVsVElq7ByVgSp4ihc1/32AkAKRlCuKDYIUrE1TOD
	C+HKtfjWK4MTAMK62xgy1WkfnXjEncbXWXHd1Ngjkuy7fn85Tr712DDXbpaHrXTFmKB3ntIPNwK
	MSjUB/emfKD97orNJPZgnzwAsHNsapBFAIjARr33WbLxAHYjxXFYgw6ZnImVlle6gb78KiXgMhX
	PUTjDwjsSjHiT7XgvVYGApBntm4w3/ZjQYe0=
X-Received: by 2002:a05:6a00:94cf:b0:842:5da3:9b83 with SMTP id d2e1a72fcca58-8451561d685mr4168497b3a.33.1781628623568;
        Tue, 16 Jun 2026 09:50:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:94cf:b0:842:5da3:9b83 with SMTP id d2e1a72fcca58-8451561d685mr4168450b3a.33.1781628623026;
        Tue, 16 Jun 2026 09:50:23 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b040718sm14167850b3a.51.2026.06.16.09.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 09:50:22 -0700 (PDT)
Date: Tue, 16 Jun 2026 22:20:14 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 8/9] arm64: dts: qcom: shikra-cqs-evk: Enable
 ethernet0
Message-ID: <ajF+xlipLuZtf4HL@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-8-f0f4a1d19929@oss.qualcomm.com>
 <2cb658f3-f564-4396-884d-d025eaa674a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cb658f3-f564-4396-884d-d025eaa674a1@oss.qualcomm.com>
X-Proofpoint-GUID: JTYog65N6TBLxLcFQwZZc-rLh7T6m6rH
X-Proofpoint-ORIG-GUID: JTYog65N6TBLxLcFQwZZc-rLh7T6m6rH
X-Authority-Analysis: v=2.4 cv=Ibi3n2qa c=1 sm=1 tr=0 ts=6a317ed0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=u2jKJf8zFqWonMdemzYA:9 a=CjuIK1q_8ugA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE3MyBTYWx0ZWRfX3jPlyfpe27ln
 +6kvtVxFoSIbtFrZYwCcV6QM7cxFHStWeixpaw9GY37BQHU+ghnoIXosRLoYafjXVc3idpcJd2n
 ClL/VPI8asW3EaRnQTviIPy04g9rzCyBmx1izsexUK1YIo5hnxvT+zHgdPsXhdn3VtaIM2bwYQW
 RtWeh4UXlChX6HrhfGoY5XU/JSmk7+U8FT0Kx747cevZD7KI0iSEHNEygO11U7En7mFrV4bedNl
 Wr6KTUgfZU83eYOvqvc1Ga49NZtD9M/PnIqdm/GuYuxPhXbQU1SuB3QX+jGLzgmek2fkQ3glaL+
 OoyCb6yHsJGtrJRtOz1tqoUuTxWxoNK0UrNKiRjUCJJDlml6ryt0JGIUn2cPGOoLM2TJCZYSqYQ
 NpaWpECL10PvZDeN7VI36YzE0poz3qsKGzkap1Cp44x5+jKMRFW5hjjCAALHqDZ3Be/1ItwUuyx
 zM1QaFnG2uq+30EzBgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE3MyBTYWx0ZWRfXyu1L43Gb8S79
 r6d007MtXT5iP9ZK93ZWtrM9x6NhKRHUoDi4ckt8xpDQKSW2Mj4744hUbspLCgfCZM1EOImCXeq
 SxohvBfNlpRWTHyT6JajWXAMjhxHJLw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160173

On Tue, Jun 16, 2026 at 11:50:26AM +0200, Konrad Dybcio wrote:
> On 6/11/26 8:37 PM, Mohd Ayaan Anwar wrote:
> 
> > +&tlmm {
> > +	ethernet0_defaults: ethernet0-defaults-state {
> 
> s/defaults/default
> 
> Please move this definition to shikra.dtsi
> 

The CQM and CQS variants have identical GPIO mapping but the IQS is
different. So should I keep this in shikra.dtsi and overwrite for IQS in
shikra-iqs-evk.dts?


> > +
> > +	emac0_phy_en_hog: emac0-phy-en-hog {
> > +		gpio-hog;
> > +		gpios = <149 GPIO_ACTIVE_HIGH>;
> > +		output-high;
> > +		line-name = "emac0-phy-en";
> > +	};
> 
> This looks like a hack - what does this pin actually do?
> 

The power supply to both PHYs on Shikra is gated by a GPIO pin. I am
unsure whether they should be modelled as a fixed, enable-on-boot
regulator or just like this. They need to be powered on early so that
MDIO can detect them.

Thank you for the review. I will fix the stylistic issues in v2.

	Ayaan
