Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F23133A03A
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779043919; cv=none; b=CyputDLHm+HXyfTEkioXDi6TVsYpSB7GulGMmFko4AiLQsBt1dJ28YGAb9x0lbATHX0/hPyRxoc1CdXXxpsI5SApTnSPbMW2f4wo5Er8ek6ZkO+/Oik354GI7EC7SRVAQrOPLyYXLsHAVkjhs/jfRSE5PWiLcGfNOjTYk1XoC5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779043919; c=relaxed/simple;
	bh=Y5i9WcyiDzQjtJSx79lz5XChtinSTRrDP5DUYMTy97Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fMLrHkk6z3M2ra25J1MTA2Kcy3YHxwdoDoOH2Zu/6hARxp65Rm3ahuV3WPGNAZqoAgWUUO2e/9FZN923MY9zul2SrXZibQWsG2jIjxyE29N05aUI5rbXnGCuqM6n9FKEdKcf4mWj2wDqPcCiucqAQXfCeb6C9sFIfQX1liYEDQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YqLG13MY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BNKU4PAA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YqLG13MY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BNKU4PAA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H1e5YK2125765
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w8qDcE/JkXAvARu8IjsWPZkQ
	lthwgFQJ1bcCPlrXmHw=; b=YqLG13MYcGs2osLqpsGGB9+Ep4Lp7BVQA8pnn30n
	jkCl2uge06yWxC1xdsrYDWBfPghOMZkIYeohGJmDgi/e9hRhVqjqg8u2y/RhdDqx
	o1W3AgwnG9b2J9FjUEf+s2VAk5LM6c/1zKTytynM/QdjRxfC9aeE8SAYayA0r7wF
	O5m+gOAec4uFNK5IGzqavxEDh/6ASx5DIhCnmEh0p0MUS1F1g4q+4tXbj+Ie86p+
	3mm8v1l4npSsrls0yLneJYRfY/BDCgOJlf0S39CbRc6oOPIjQk61RhM4zYS+Zmr0
	1RrQtnpX57ZmRTS+SsAytHuKx1YGusMguwe1jERRJB8qZg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvqud17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:51:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514cbe73d00so57406101cf.1
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 11:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779043916; x=1779648716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w8qDcE/JkXAvARu8IjsWPZkQlthwgFQJ1bcCPlrXmHw=;
        b=BNKU4PAAl/d/4hFcuu1gCJ882A6UYQAOoA6+BIhE9U5Qvb1tdyQjSzKk81MbVz+cFS
         JkeEqwVWdvWFi66iO1tDY2XQgB+q900XS5E+hdth+Qfz7Lsq8kB+609x3V/v79KOJsfm
         e/yULAAwQSa3oSpva5IeUR9TfRaIvcgyrl9h1ZyinJfHyYkBopg/aJ8+4WWqfSXMQqw2
         SBe7/px5067JENK4ZJNt38cYq83cs+y6FrqPxuuoVdAraD8hnA9z3HijUlok2kW3Q8wH
         xQHVAW4lwhKExwdRWr6vIY3np3/5KT6U+tsykprzGBljHvaRYm1zToREOzEk9brF2t8W
         0Y4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779043916; x=1779648716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8qDcE/JkXAvARu8IjsWPZkQlthwgFQJ1bcCPlrXmHw=;
        b=C6QYwGYd5Nld95q3THzL9jRuziYrET1isbfz9SpKwnURWjQmCGuelhox9Bp9e54O/V
         v4eYgHlTRf+wxVZzYALWNVAQoh3lSMmRw2OyICXB/QqWmqQY3Gg8cdVKnsa1mM6cHNcB
         5Sf7daOLrWcq67mYJbyIq7s8qcqMZ/nWQaHAK3rc4TWbDoikVw+CSYzZ4toV31JMvrv4
         hUfG7Soz5dzKzwRjo8BSm9privf8R75U1CJ22VIVQgK3naSOXbhP7gtpdLc/QtXTt8rt
         f8n0VO2iqOReAgEgj/wI2vo37IoENfIF7ryh0kVTICydahSsxynWu7Ngvb9kuEZIHbEB
         7kYQ==
X-Forwarded-Encrypted: i=1; AFNElJ8L2ENzaqvopDlQoXeDMu9Mgp+TJnAjVir0q6JyLjdRHV9UM6+YkrkB73obckJq4cmueawcrOZofuTs@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/75c4Ha9poMcS60RQTY+gcNfZh7ZTd+CBM6lXd78jqLlOnKmK
	SvbjJQvhRAZVC3LDdf9QJP+AvoOzq9jUPzZ41cTjv2FKLbYytb9zeHpSpS/zN+OKLp2f6hX8BOR
	Uu8Zj/CN4TmZUgUmWwiiGD5QK4bxhEmMvrwl6bzSy15B71uhee+maY73oFXESSZ17
X-Gm-Gg: Acq92OEMbwW6QAZx/GUFLz4BC7qyLhEoGGQfOGbM70TJ3TQ8gQWht1c9se4LtXZuTGr
	9XDfnUuIjW0jdNZXenbY01uoVXHOCKDR61X4HYUfYx+Y+jZftwBxpgH3wG370gvRtBipaLYB6At
	pZV6s7VnS1tEiX68i9UaoXIjanwbYU92EAJ2DqH7ojKUiSKBU09PS0KfEC4MZEq7C6b4wzwU4W9
	ikI89/DqMH2RoX3w6e+bBsJxEJwMpipy59Vxi+/6oOENALqbvIcTeUvKjO0xzJSiZtzH0cteK+f
	FIDQ82L4CMlpHw3frc10CthZ07aPZ+3qGY3z8mUf2P4MXqVuM+meQv1XhhMmtwHWkX9sdCvVCYw
	DdFGspLB1OVAJgrC5ucy/HnFI79AUNZi0VAKtBuXADGKRnW7FHPECQJ+t3FutA2cgsQICUU+vJX
	Nq/7uutlFE+fOL2BfMMhmCzCcVZUjV1ZebslU=
X-Received: by 2002:a05:622a:4a0f:b0:50d:a4e6:997f with SMTP id d75a77b69052e-5165a03ad56mr162139341cf.15.1779043916046;
        Sun, 17 May 2026 11:51:56 -0700 (PDT)
X-Received: by 2002:a05:622a:4a0f:b0:50d:a4e6:997f with SMTP id d75a77b69052e-5165a03ad56mr162138991cf.15.1779043915619;
        Sun, 17 May 2026 11:51:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395882c74d6sm6943301fa.15.2026.05.17.11.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:51:54 -0700 (PDT)
Date: Sun, 17 May 2026 21:51:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: ipq5210: Use icc-clk for enabling NoC
 related clocks
Message-ID: <whx5dpg3ji7lj62o5wvcytwfi7wphtlooqznkeeeeixkhegw5k@7bli6m4w6frn>
References: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
 <20260514-icc-ipq5210-v1-2-b5070dfbe460@oss.qualcomm.com>
 <5zdmbj56ndi7nrvdqadinrf3sneywft3uaplnoxugp5zetsfbj@5hazmuzyfz7u>
 <agc+n28PfkrxwpuJ@hu-varada-blr.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agc+n28PfkrxwpuJ@hu-varada-blr.qualcomm.com>
X-Proofpoint-GUID: IMRYTX8YRCRzMbrS5-sCwBS-2NX5vDvY
X-Proofpoint-ORIG-GUID: IMRYTX8YRCRzMbrS5-sCwBS-2NX5vDvY
X-Authority-Analysis: v=2.4 cv=LKJWhpW9 c=1 sm=1 tr=0 ts=6a0a0e4c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=92o4APbqSy6JO7topJkA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDIwMyBTYWx0ZWRfX4fkeuNlLEKKV
 RzIMsDJQYxOIIB7gIFuKBQJt2/pd3XsCxdndGJ71YikBtYnFE1XosO3n60Op5Y5ci8CDasz4B0p
 8M+59wHu9ln3/KsRMWSAAvTbxpgvu8z/4xwVn8zixJzBRGRXK8u4QGveEEhAYgfm72PKqf3JmCd
 nyajfx8xalPa7STrMuUOOL/5zdWT/sLYABPspcTRUrzxey/nrjiA34n7nHNO4bkeI4H9fWQchEb
 HK0RiSbo1zcI/4Xn6W/xlV5snZooKDRdaQnKqwJaONutoCxX1NIaX5ewytX+LIiD0/NWdo+F1MS
 LLTGxxYVoiwrt9sRsIDuoXA2letJU3GvL7xmoEIx6lqJ6e+JACMNVDoNoVIidbu7gZTcI4Flwlm
 BhNpaPnLdqxEbeCmvIvaormJswZq03LvVWZqsffld68dwQYiNZO+VxPBuMOj2WVJfvImYVac6yG
 k8TlqtZY06pEuRzA/Qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170203

On Fri, May 15, 2026 at 09:11:19PM +0530, Varadarajan Narayanan wrote:
> On Fri, May 15, 2026 at 04:31:42PM +0300, Dmitry Baryshkov wrote:
> > On Thu, May 14, 2026 at 09:35:36AM +0530, Varadarajan Narayanan wrote:
> > > Use the icc-clk framework to enable few clocks to be able to
> > > create paths and use the peripherals connected on those NoCs.
> > >
> > > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > > ---
> > >  drivers/clk/qcom/gcc-ipq5210.c | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > >
> > > @@ -2642,6 +2657,7 @@ static struct platform_driver gcc_ipq5210_driver = {
> > >  	.driver = {
> > >  		.name   = "qcom,gcc-ipq5210",
> > >  		.of_match_table = gcc_ipq5210_match_table,
> > > +		.sync_state = icc_sync_state,
> >
> > in Kconfig:
> >
> > select INTERCONNECT
> >
> > OR
> >
> > depends on INTERCONNECT
> 
> In drivers/clk/qcom/Kconfig, IPQ_GCC_5210 can be selected only if
> COMMON_CLK_QCOM is enabled. COMMON_CLK_QCOM selects both
> INTERCONNECT and INTERCONNECT_CLK.
> 
> Is select (or) depends INTERCONNECT still needed for IPQ_GCC_5210.
> Please let me know.

I've sent [1], let's see if it gets accepted or not.

[1] https://patch.msgid.link/20260517-qcom-clk-icc-v1-1-1dc6ea8bdcd0@oss.qualcomm.com

> 
> Thanks
> Varada

-- 
With best wishes
Dmitry
