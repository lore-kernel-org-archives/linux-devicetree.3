Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC98471CED
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 13:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937329; cv=none; b=sbsmhL5J2/FdLN0im2kxvz1q5raf8M8B9pDSaIliFqI/oMTYM4p9fCwgPklaXyUD5OF/wwYAZuuidLxlA9H1+tirkf3HYxIlUD8j//eQsbW+ALNPw62t+bjvF8UZx2s5lH4pmXhsBpNMrz8qd7g1Q4gqSjQeuOJ89fL0vYpBKjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937329; c=relaxed/simple;
	bh=hvJ3Os+S2rmTQ3etCGO9FFdUReZsyLVdsxChBr5MVlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNRwSNjdaivuH0KW7WXJ2by2epuvpmLbigaBqNdguj1WicO5RYdR2YuhHnu0Z07yaBCAZVnafF95bw4I4fJCLtm40two7v0tUDSpehxGTkdUl9Zx3uzts1/T0mpeh5dvDSkxLDGB+L9ChSB8JiTms3vCDNKPBdo79fVBjmGM+AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SeMhmsPl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HwSlnMKH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SeMhmsPl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HwSlnMKH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675BvtCU3124671
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 13:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QGZ6cVzjYD1blhwp59ff9yPA
	j+yBCEUxvcvUKqMHV24=; b=SeMhmsPlBef8oJZc4zxXQn3r7QrYTU/pwj1MqsQj
	MCpO2jYD2rSd9WYrN6TGYtXghDRU42bINTwbo1b13k2QBEOGc8Cdig7QN2ATOkUr
	IYdDwZs2NvahzywT03bqqFlqjFNiqD9GF6Rj1E/8NgLhJ5D38lj8ySkLURrtAnd2
	iKorZJ+2KQZsUhMPPjh6GohtqY+4wOrS3uBViiSBUUcGgNwcNeknnq3zZb4vOscO
	tLqRKrua88cCmmLd6lJSV2ClKTWncap4sEm8Q5jEGUxVtghvjBSh2qRBTXwRQChN
	WJZLK0c+ZMOkfU4LsiTjWfoF9+udp8DdjmgZEOy4SV5vvQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv14w9ft7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 13:42:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8fc6b670b4bso11207026d6.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 06:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785937326; x=1786542126; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QGZ6cVzjYD1blhwp59ff9yPAj+yBCEUxvcvUKqMHV24=;
        b=HwSlnMKHTWZHfItPdsmOdlPJj9+IWqdhOmdLJGET3EfkKOE9gzpGyRJ/m4DoaE37ox
         U4YlLaGHUCx2PsJsbPKbOMdmtE6sb2YShW8fvOmOjFHi5WZ82QlVZHUZpASL53gE671L
         9jklsKX4Png3i48t15ok4Nbiloai3MYkn5wZP2Yh+8Jtvc8Ddp7N+h0q0J9ZhtmgWO4g
         aqY8IUKdNUmQnurYfkXe5f9bHTyZLLi54Do1qC13bdNczkluhhCrb3No1bJJ033a7GpV
         xLX+3VIE3vaXTP/LORKIJC9wiN2QKEL657gZFfJYbXZEKUVWSRqJMbLwkQL9khvz8aGO
         6gwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785937326; x=1786542126;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QGZ6cVzjYD1blhwp59ff9yPAj+yBCEUxvcvUKqMHV24=;
        b=Fz1S9z9RDCzIZoQFKqXgGpL+JoJvGbcRVXQTGTX73MHr3C/8Z03BEpzMvCcYpXZqWV
         463dcqax2X7mrI2M/n5UMpzi7YLhcwiClqtl3hsKwadpOf7HIlETkijzK9zp2eeVcK6O
         69osKrvaJMSVh5rY8znw9Z9xj9itPBpYJ/AEjSx+PME6oR85wGZXVDn1lfjdCraaL+qD
         VAmOX1IWPcpG1hUUy2+0OHxoYerVlsB9jDqJCgHhBbe0GRj70i50D8YRF+yw6QQ1rnO4
         IHuDdLtZc6QwZxuTsXObmH8EecAe1G+cIacplOM6zyA/AzHqjkBBFCsmTO0aOjGAc43v
         rjLg==
X-Forwarded-Encrypted: i=1; AHgh+Rpv2W/iqnWBtF2pKwoNzibkxfYPe/NElMQYxR6E4efVFQeI+VsTZ/lA6qNnso+iC6108gv3VN5WRdB4@vger.kernel.org
X-Gm-Message-State: AOJu0YxFRVvWhDJ+kRX6I2h4+ac++9tBdA+MZsm6L/p2YqIPl/hRTspE
	nWcIwIWmmPEPnL+XAlMjOVLYTkMFOsTpUPMBsIxg+lE0LpRhjWXPvs77SFxTH8oZygHvmMJCDUp
	lHV/0jqu7eCxIQF9dRxM4S3fQbOFQ1AoA0jB6kBX7dwV4jnkXJr26a5yqIkTexg3F
X-Gm-Gg: AR+sD13blIxQYSnAuBNXJCXOSK+uKjDNOdxdlN0G6U45jrjasQMWy/MbhCbcyTtFbML
	OX/eADpU6sz/r+ZfwjS9pisn6GW4RS9v/jUcZelTGRIvaPpdAWYpmsbZ+WOyohYaH2SVYpSksFb
	OM9q3+umcjHX+qWjYnwhU6TG+7KaHU1yucSUEVPvp23UvfHFEYN9fs374ZMIRotA0/EY9711KeG
	AyfwqoTJ40rHjowbskgrsk5cDrVugcZUEgYyJWYnlBrEb6dQOiKFBlQHOajzoc0dcN/p0lsOSPY
	jG9+/E1oTaN04GFn3MorvTG7FB1S1ZinypNXZsWr4d9dux7PCil0Yz2IS+6tEH1UOAUZFGaU3Wp
	rkBqxymHzZuof/g==
X-Received: by 2002:a05:622a:60a:b0:52c:e0bf:dd79 with SMTP id d75a77b69052e-52ce5f7f999mr67815191cf.16.1785937325708;
        Wed, 05 Aug 2026 06:42:05 -0700 (PDT)
X-Received: by 2002:a05:622a:60a:b0:52c:e0bf:dd79 with SMTP id d75a77b69052e-52ce5f7f999mr67813741cf.16.1785937324345;
        Wed, 05 Aug 2026 06:42:04 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.37.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2036422825sm117379166b.43.2026.08.05.06.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:42:03 -0700 (PDT)
Date: Wed, 5 Aug 2026 16:42:00 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 03/10] arm64: dts: qcom: milos: Add power-domains for
 camcc and videocc
Message-ID: <dftvxtkdz6bnsnu3urcargv3saf3vi7iyaab4uaso4g662ddes@qi3ufx6wweya>
References: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
 <20260804-eliza-mm-cc-v9-v9-3-39067760dc3c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-eliza-mm-cc-v9-v9-3-39067760dc3c@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDExMSBTYWx0ZWRfX0UXptpDjDIFi
 MMllTDfHc6NlJvLgJ/iBdVzjjCVmUdw6F67dmoahsCaK6DmSO1X8GFQlEYdTiclTbfAHM8D3hV7
 iOt3Cx5dTXAg4PoWeKZkI3q/gSzW9Jk=
X-Proofpoint-ORIG-GUID: B9kRR0hvStV3cRMRzf0_Q1T7b6PApF08
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDExMSBTYWx0ZWRfX3S/0J/SBYLRc
 43x1GKwAjlSd1P1l9Wzixm3CZ+NNd8TAwujcn0nHg4M6xaUORR5IW0Uj41lTGw3J05Ko6PO2YDi
 J8/oq8Zw8+TidWz+mCf+n+5P3Syf1HnqY/7Pv3JDUGdUKJCXHqFFdA4muIbVC/Iu5jtqV+9HBw+
 wgIRRJBabFCsBpPR86qMFmqoEyHEYHMOr3RKFfa0/btGQf0z20YJHDjecK1vN/VqB9ZnYvr6Plf
 YawKkTuAZCEPM71bLIA4kIg+WvMEmkvVGbjN5JQW7qSt0k34TKIjkujCN0JQsgTIz1qGo6Bgwum
 uXTVi2XvucjjJ/Jvs1vjhig+bWfGFlsXeSmLu9SBALWaetQwuvfD6PFzVrC+ed02JmpsAV1flF6
 oc/zjiHOsIYzNAe3+oJafR3zwHuKqR7kK+CXZjGyglkpxrR286JXCUjOm4mhOr2t+HeDT4YgDVT
 gDn2161C1ns72BO4Eig==
X-Proofpoint-GUID: B9kRR0hvStV3cRMRzf0_Q1T7b6PApF08
X-Authority-Analysis: v=2.4 cv=Cu+PtH4D c=1 sm=1 tr=0 ts=6a733dae cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Afnz6uBANMlDQL2PJxecKw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=vyOKmKYE018VkNFVGwIA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050111

On 26-08-04 23:20:16, Taniya Das wrote:
> The Milos camera and video clock controllers operate on the CX and MX
> power rails, and require these power domains along with their
> associated performance state votes to be specified for accessing the
> clock controller and its GDSC. Add the 'power-domains' and
> 'required-opps' properties to the camcc and videocc nodes.
> 
> Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
> Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
