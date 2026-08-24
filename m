Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6513A7F59
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787559156; cv=none; b=kbYwu6GIYQIIDi9qzCalashxqEZZQXc1NK6MqRPL+50OuhvtWY9+mms4MNOXbpvwTpNOLtY2iMpkkpCo2+zPbuzs6yNKVKXwtHoxS9PFRQKctrUH9GtbGFQDdX+HXjgG9eOhhQiUS5IKepmd3y9PcWCdnXLxyoIKxeEUsDU4PZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787559156; c=relaxed/simple;
	bh=lh3Tcxk05NWD/OL5zpuX9U5hLlE5hZNfVWbxM/kIojk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2Zm0HNGRE36VzCsMcxVymgkoc6xCuUE2w7YKs6ASueDMqHdOperkXpeNg7lO3P4JsGYk4zeh/K6GiueZlV3vCjm9MLaQY6HF8HgDsW96h7DKpFPNqOPBTbN6SprEP8tENL7GM6fsE91MV0s6qEGAURAJOLx2NDAsnarBxdk4oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M0HEcRxn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SbSz7J0Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M0HEcRxn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SbSz7J0Q"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RN901478035
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=892U6daOvBsDZR/zID1RaXZM
	26ByMlYVMiJ6EGwCtoU=; b=M0HEcRxnYTnuDgshBZa78TjUPXutXkHGE6dZ+Nbr
	z8VHGNp/oyMPgeM4FioL7a8CgUPWwdzYeG5dle8pCrM4oNmHMI73dT7t5nw9sMYR
	wXOoFreK3uzTlhp6QUDJBq/2e+gj4jOiXRft4WX221wbpoFgE0YeBLhHVt5x/Q9c
	GzowvmJHn+iuRDXg0INOTn712CQvJEHBe4FJcNnki1PmAIKEq99vLHnNkW8325Fm
	OxuqvKeMPQkqlKhVejOMfTFD2NOYvI7cD3yCdmbXWS+zFwDXVcL4sdbyWVkiE6bH
	O02CSPNtZegcdOjJzr66COpyDH/iKgA5Nkp8onXLWNQa7A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g7528nwq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:12:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90c8d271ac9so47383036d6.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 01:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787559153; x=1788163953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=892U6daOvBsDZR/zID1RaXZM26ByMlYVMiJ6EGwCtoU=;
        b=SbSz7J0Q/3b9+fDF23H4i2f9UKqN71CjpRSmXRShkG4mZI4zH4kzwWXU2Zn/2qEYWm
         bO0CQbIpSf9jIJ6+PC2wwcxDv5Pa+xTnHVEqBcWBjTpgNUF1+WhGFEtaZ8K88+tvDNrV
         tR3bpKBEf2G28p0r8sxYI6fcExTQWqHgm/MahGS9Pj7zzSID95xNeYa0g8fMXrQEz0hp
         Z+fdur1MVmqPFnH6BoN6CPEPdszqVmhpS2T8jVDhOGzj6dB2mJBkMep0dI9RRDDiSNfb
         rrJC3RExnz8fPjOJ/IjoYpM93gxds6GITitJs6fZgg6VMzkH/6fAZYPD/2nb+/94ssOt
         QDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787559153; x=1788163953;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=892U6daOvBsDZR/zID1RaXZM26ByMlYVMiJ6EGwCtoU=;
        b=l8X3TU6MuoARbP4VYXTywKfQzO6wvPcLr8gwKvn6y55fWmVRANkRz9f3vq3vDz3DOb
         efBIfrskQcmWkYXyYdd7GAdXMmiSh6/IwHaDON44qZA+xD+dqUD2C8WzDntywB9xRY3s
         T5V4hajCRoGsu1nNwlWXObPka1zPPPmld/BpJ1FoobAIVT7e5reoucACEjV6aQX9pjxC
         wxDClWl9ij1wFEyNagZxK4jiKk/HTUnrsdOpBGWf5uIgHmze1iAzMG4V2hkz+3Ty81zo
         OW5vZRCJ4Xz4EMKN0YY/gtBkvoe+Yv4PjMeDXdaI10pPeka+IXNHpW53AqRAihxUdBk/
         j09g==
X-Forwarded-Encrypted: i=1; AHgh+RpWmmDGVSbHnpMgSfQlmatWu1qum9bUFfSj0GlJqqnjpnMveZPMwj0ZiRzU/rEY7KCD9dn45wxyqqGv@vger.kernel.org
X-Gm-Message-State: AFuF++lOt/BXjBBJVgASIWYOHdZaSpscVHQjZDYPIbIubh38FqdtBEEG
	kIgBwxKjtOtgsF+KeIwRp324AyKwpq9ut+m95H1CTmVq8NUZ8UgBlQpUGE/S5fn6KfB6pQ8k3PO
	ZopG5hYJsHtC/9NE9wiu/J9eOGeZh4TDd7grQCz1W0Hwag5JsjHB+Gwx642rScV+a
X-Gm-Gg: AR+sD13/RhoXvn2wmerqhe8Wcwje0WsGQ2aRuOMHvAKv8blUgr+GE6AY1UrlGnRCVc2
	LE2+KbUuCTiXAFw6qnntf1Of0BijDNZI2FE/Ma7Zo2oooRZAWcB1XHoXRIIgyrORJ3Z5GmSgmdU
	f3uNUpp3iDaHCSzcmrJHot6+FN0QlimAnUSJwng97kmohAPGwyHiJ2UGxeM1eeIpbYJpUIdD+fE
	DB23KIGX03W6qwLtJ7dCOfT8EmgH/vys1ie7VdofSlimCTblCUuNDX9fuWc3rrMitWbhfr8TI9B
	v4z9CnCxLhXbQVIFygil8UBHdonTYiTFoIQxeKmgx+QKZHbaFe6RSzda8MLfIENH3GqZ5+sOqBg
	/o/1F0izGEyDnB+g=
X-Received: by 2002:a05:622a:5143:b0:52d:9dd9:63bd with SMTP id d75a77b69052e-52e09bcd449mr160083831cf.10.1787559153549;
        Mon, 24 Aug 2026 01:12:33 -0700 (PDT)
X-Received: by 2002:a05:622a:5143:b0:52d:9dd9:63bd with SMTP id d75a77b69052e-52e09bcd449mr160083521cf.10.1787559153095;
        Mon, 24 Aug 2026 01:12:33 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24d6f203acsm108824266b.24.2026.08.24.01.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 01:12:31 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:12:29 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: segcc-nord: Add EMAC CNOC APB clocks for
 Nord SoC
Message-ID: <z3d2awmpulr5cwexhso24verb24ec4rsnj4pxfhhqxwezrfjat@pwoxszguelpg>
References: <20260824-nords_emac_apb_clk-v1-0-290767386bf5@oss.qualcomm.com>
 <20260824-nords_emac_apb_clk-v1-2-290767386bf5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824-nords_emac_apb_clk-v1-2-290767386bf5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DsJmPm/+ c=1 sm=1 tr=0 ts=6a8bfcf2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ybGuUY0XYtVVdYjWugUA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: paG8eOaXFUOj_Vdp-vGGaTcLDzzDZIne
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3MSBTYWx0ZWRfX3wU1+4weVHsU
 ddfRMPXqrtb2e9K1USLTMJlD/bDqcmnuKS6z0axteCcf7/PsuqMQn7h5H2xxBXvXjJMX9/Jscy5
 CtNiPVnnmI2DRY0+3Up9d9CqtkR74ac+sCZKRl6nc1KM3k3vf4X8dH3BSdysZsNy07mDJIP99xy
 1LAncoIQAtN3Gd42zw6kXaK6frQyKh7JyLju9xT1wAm9seU+j3U+Skqj4MsFIE7mwWiTskVOcTy
 Mw/uU9s0eBYn1HVqrjvzMwMKhKFsnl/2ZJgH3P1zXh20Q6Zd7yp0IrZweh8UqNzxY1equiT3cqm
 u0cH5xx01LbRi900+IkMH3bTgJGQtnt5tH3Zc73n2/sLxVaqhIs+hjwySpTHC7iObLfdhWz9Eys
 LB73irGNwwCpWL9U2gyw/92uAsMGf+etmhEjcTvTSR9gIfPf5bAQ0dDlguu1DtevJOcSc7S85w0
 c2+G25fM8FzXn63megg==
X-Proofpoint-ORIG-GUID: paG8eOaXFUOj_Vdp-vGGaTcLDzzDZIne
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3MSBTYWx0ZWRfXzTQN2JCaw4px
 K37A9qK8IWYWteiwRZeo+pHDoKL8hEZrZxfDPmX6N3S6qekYTa/JKH1tTNe+sX3kZH0+DEpJ5B8
 A+KLTQxY7fIMkTn1W/NTb4BPBhcZU1Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240071

On 26-08-24 12:23:30, Taniya Das wrote:
> Add the EMAC0 and EMAC1 CNOC APB clocks to the SE_GCC clock controller
> on the Qualcomm Nord SoC. These branch clocks gate the config NoC APB
> access to the two EMAC controllers and are required for register access
> to the Ethernet MACs.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Fixes tag, maybe?

Looks good otherwise, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
