Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C5D3ED5C3
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 12:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779971302; cv=none; b=s4fkGfq1jwoCZf1geVgDKr+WDGhwb4ERzz5c+AdVNF+CoJ3lRADxjVOj/NuIslhgf1KWn/zbDXkx6IOEsezAIU7tObOEjQbo2HgGzdcfKgk0N9NKBz8OgK8ic5QMbsO7sqP9j26L221TKd7X77BPxMs/E0ACqB5wC4ykRLOgS1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779971302; c=relaxed/simple;
	bh=0m9I34TWmqjqBrQjMDf0uEc5IBCUXBa+7iFjGnQoWRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oLwztVZkEciGo5C8Xg+p+TwIt6yuc9vOTxDcygIqXe/8xW9yiwMtFcIjzKXqbGjYrOvtKhToCvG8eyB+SVuJcGjzMJLE/+Nei1v2/O92V0M2i6PpNyLD+0eXuDoQmyAF820SjqP2AzuKKXOMU4Z809KuCKXYo0sN77MymFZVb/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIbj/kG7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MqZ8P85v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIbj/kG7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MqZ8P85v"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8wFuu3204751
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 12:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P7CNWFCkJuE0aXgNOkJJeWzN
	CMG3mZxFBsF+0yJQu3s=; b=ZIbj/kG7oZOM5CmcxnZ8bU4Ddj/pR/DF7NcHtaT0
	qK3zcJdY58PcpRv7v0i1jOvXVCD8Q5W+O+D+5VhiYCzivllTU+yJ9Hfe9mI75o5X
	z6uk6Y45i2pN4cwa7RuulY05+o4aPx+2zjyps4+KTa/o1o8fh78dXBNFQKWhM9We
	g4UD7bgxu7q5/v7r1oejTfPD7jCcZ9TZT5sDdgvFmi/CHO9L5myXWIjDAKaxnLtB
	QfhG3hdqaL+Xa3P/j7foDlXzqouWxzXb+zdDocCU4gKIgxZa/AcSWWP1ztn7PH2G
	+wQIGCGXSGBBFiYBCXTi9qanoTxZcte/l8cR4bUwqDTfgw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynjpr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 12:28:20 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3041ab826ddso12652770eec.0
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 05:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779971300; x=1780576100; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P7CNWFCkJuE0aXgNOkJJeWzNCMG3mZxFBsF+0yJQu3s=;
        b=MqZ8P85vb/ClRQghnX4IkCu4B8tHSTnAmAqTIJy6lAK1I54oQ+qmVfolShEzSa6JE0
         QG9zGb9inbnB289hDLCdxOoXpNXgB5l/JgqwWboeKRpmopjTbW8UK5rf0oSil5Y2xJHK
         2he0/wsFZprxlooJCOIA4YJeGpI/ZHxBuhW8Xp7zCFy4rxzoy4J7/dw5zMXDFXMd5eUF
         FbUMReNQgy639GVwnZmDeoz9meoou2EuIyqOC8qOEUr9JCQvV/V1EKvbb0PsrbZz62EZ
         ChMQ2bKtuZYn57HZqwLBuBBYay7OIWD03iKuEF4XpKXmdv0T2vn5myipsJTiyfqgWC+3
         hlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779971300; x=1780576100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P7CNWFCkJuE0aXgNOkJJeWzNCMG3mZxFBsF+0yJQu3s=;
        b=hmm/oGOEHyQC+LElBvyQNam48kNay3r0u5eAQDbxwOBePPm6Zt+EgZmre0B6Y2ekNB
         evLH0LmxbbPy9jPDgC23kRRNIlcdiHygA+tBsQGI7l+EqobCJn32CiB/vlV6pGImYxQn
         GClhAs8tJ17P2htf3mmUL4Vk+0gAE2FvvCUGdYJwHkmTM+MRoaeKZOX1cNPkIo2Kvzfq
         RSuQsxyyViSyfOY+a++8KYDIBgj9qKiEd+XQPa4PJ+bXU6pWlRagT1Wr4XnkLTRsvuMn
         53w2UAPpEUoxnrj2ZC4GwriRaVtFJpJx5ShKLKnfrvmjKBkeWB9yVXXsFp0OpY7UkhGM
         YNCg==
X-Forwarded-Encrypted: i=1; AFNElJ9Psycr1qRqQgm45LbV7b5tgoOalzPG/adhATq6GzTWdEcShUNe2rSrJ03eol2y/3CC7fPGhESMbpxY@vger.kernel.org
X-Gm-Message-State: AOJu0YxWx19vvlNlr9i/lfJYcNCFps9YDKtKVlZ3P6grebZd4534JHh7
	78KaLTdV8L+PKeB138t7sSzIkeYWpMgytVh5SxPstPQIGSKvkNY5d0JvRPu6KMwTor5vr2sc7iL
	XRXcynCdcz+A1e48ohxQpXMRBLOGMmWmRB8WPTGEQ8J/JtFyYvfTv8X2OP5IYVEhy
X-Gm-Gg: Acq92OGONaADW4mag72XFBxlxBbGvK2tUXhkrtxDRiYEfUnBnao1T8BwfRaR1Rv6Z0+
	43p6z2si3otgIMvhvyn+ec2rZVqHGWRcWagw51qCwYrpw0Wp9498B+DMslCkxkmOsI7MZnvDLrp
	/UnIVfAdI0YSiuxMO3kFdzutcez4a3omf1s33qbwRaz48rrKA2YNlRPfJEEIuCQy6n6QW0VBcRr
	JL88ICdOcogA33pTsUCsR/zkWyf6+qYA9wefea+3oJ8pjugRN0mLt3mfKytFmiZTYDCVTsfpsVw
	eexMkSbR0vLS5p5zMZMGfystRhxgeGiQvt/xT9J+jt3tLubZyGGJvQxLO0EUmiHZm7cDCMUg3iu
	pH0T7nSSJlngBrEAwvZyHYgdvfrFUMLUFMqROTQf6ihzANbUiDsqV8X+pY+X6nGHhI1jcPlhM+r
	3LbTk=
X-Received: by 2002:a05:7301:5807:b0:303:f26f:df30 with SMTP id 5a478bee46e88-30449096805mr11884142eec.23.1779971300087;
        Thu, 28 May 2026 05:28:20 -0700 (PDT)
X-Received: by 2002:a05:7301:5807:b0:303:f26f:df30 with SMTP id 5a478bee46e88-30449096805mr11884118eec.23.1779971299562;
        Thu, 28 May 2026 05:28:19 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045245d6aesm14523047eec.26.2026.05.28.05.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 05:28:19 -0700 (PDT)
Date: Thu, 28 May 2026 05:28:17 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: qcom,sm8550-tcsr: Add
 QREF/REFGEN supply properties for glymur and mahua
Message-ID: <ahg04dmgSWPuA4Tk@hu-qianyu-lv.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-1-ded83866c9d9@oss.qualcomm.com>
 <20260528-adamant-termite-of-drizzle-0c39de@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528-adamant-termite-of-drizzle-0c39de@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEyNiBTYWx0ZWRfX005qq3IumIev
 1GPMeQtc6GyXC5fzagt0OEaBoy27sBDVRDO7K3cofeKs8DDusVk9I9UGx9plOjbb4Ml3Uz26LTU
 SttFYbsTm3WBT/Sn2cZUlcrCnint6DEFxIl96COjXNr+EF/OiLc31dhkuSRD9O95DbBG4uFLSKI
 5X2MaIp1h4vY/IrBT1wtmLxRLUJjML1lpaEDJddny/nwHNNDix6fnv1pg8mZc8u8hhZCloLa8PV
 Qw8QNR2YuiL6ekwwRcI6Jd+YSTYL6qtqcCid5An7URHPy7kT0nf4LOuUVj60wd9cDfAMdiI+GfE
 8pWKScujUlUYUMtdYBd+rEwuvc0015mx+jdTbToYgbNicIWpqZHfsFTgXlYjlXlDPzYKJSPnP8u
 /jMGrBo6Nq3D8Lex5ACjo1Xy2/9mjexuM17dBEEjP5u7t2JaTve3HHEBrWNvy/NgdBW2K0qaYLE
 xFKQTzfxX6LbTnToPqg==
X-Proofpoint-ORIG-GUID: -3kLxDWc9tXf_cTPOFKjcE5HO70pN0Mt
X-Proofpoint-GUID: -3kLxDWc9tXf_cTPOFKjcE5HO70pN0Mt
X-Authority-Analysis: v=2.4 cv=EdL4hvmC c=1 sm=1 tr=0 ts=6a1834e4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=48uwnw2qJDGHVwkyL2oA:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280126

On Thu, May 28, 2026 at 09:57:10AM +0200, Krzysztof Kozlowski wrote:
> On Wed, May 27, 2026 at 07:29:12PM -0700, Qiang Yu wrote:
> > The QREF block supplies reference clocks to PCIe PHYs and requires
> > dedicated LDO supplies to operate. The digital control interface for
> > QREF (clkref_en registers) resides in TCSR on glymur and mahua. Since
> > QREF has no dedicated DT node of its own, these supply properties are
> > placed in the TCSR node which acts as the control interface for QREF.
> > 
> > Document the supply properties for qcom,glymur-tcsr and qcom,mahua-tcsr.
> > Both SoCs share the same QREF TX/RPT/RX component naming, but differ in
> > topology:
> > 
> > Glymur has two independent QREF blocks fed by REFGEN3 and REFGEN4. Mahua
> > has a single QREF block fed by REFGEN3 only.
> > 
> > Mark the relevant supplies as required per compatible using allOf/if/then
> > conditionals.
> 
> I don't think you implemented my last comments. You need own binding
> file.
>

Thanks. Do you mean qcom,glymur-tcsr and qcom,mahua-tcsr should be moved
out of qcom,sm8550-tcsr.yaml into their own binding file, e.g.
qcom,glymur-tcsr.yaml? Can I use a single file for Glymur and Mahua?

- Qiang Yu
> Best regards,
> Krzysztof
> 
