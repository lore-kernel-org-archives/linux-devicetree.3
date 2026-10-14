Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E704B95C2
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 08:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966487; cv=none; b=RzB7QUM/TP9N5cOzSURgT1e+0QMHRFtfCfoeh5iSii7n0dcgJFhPb2bChh4RctXsm8ZzTZQv71k9JdMNGXdAQo2vwPfU9E3XrSrj1PH5gMrLHzqvEPHcckveM5g/707+2F+ckHWU2KL/lr6emCTeMUPEVbo+FIyzBXUdxo53q/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966487; c=relaxed/simple;
	bh=hA5Jep5pACbObsfPa/fLER2WRbYqlyN+IWuj26mmClk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qsjJN4Oc3ZFAqRuyIBVw+RD2t2KeB3Z+drp4PyTgk5QTr2EdvTiUquLITB3+0XPUKDhXx7oPSdB1FOIgVchKEDfBFr5MWKqSXetKmmae4Uddoz2x/wtFnNROEbV81RaBLz6pappAeOWj8q9GuuK7NWKU7uxKOfXYkFIOftABtmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J/Vb5+OT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hYifpD/e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J/Vb5+OT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hYifpD/e"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E4ORG22222109
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 08:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X/S5SRmbTexKmsjmoZdpsnlp
	+I+xKbH89Xqk3Tt2TQo=; b=J/Vb5+OTiCuO5oBT1cUQpH44EzoDl8aMYiuwNo3U
	+8tMf8oJDgglHc10Mrm+/F253hakhKEnVDaQ59fs3VMpQiDqmKTcoFkuRVADPVV2
	tzvkl3rmFHz7Dw2k8sI4+zsHJZLhmnV22iPDG4DASih6k+VWTHPmXq6mSOMKdAIj
	dlW0GpP2mjZPDekHXKDsMWkaFR5QsAivJmAw98SVlY8fNpoZN3XcElodBtqYh1Zl
	j0/KliDizHtucSam3winuX6RTotlBTURlkaoxkUHG/MUQqJZjzO6WHV2MIa6Xcrg
	P0YjC6kv5HNALn/rccCW3IIypKp3wSBSd6A/QHAMx50Svw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9txsam5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 08:28:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a082c014aso176818485a.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 01:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791966484; x=1792571284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X/S5SRmbTexKmsjmoZdpsnlp+I+xKbH89Xqk3Tt2TQo=;
        b=hYifpD/erz22hhnZghl5Tr3LRKHyig0g2Amixs5pkeUaEvpUmk1KWJy/zXtsM3pa+o
         2FwmPutm2OypGVrWvbvdDVM12eO/0jNQO9cyhbSK2yhkwFo/ujoQTBZjtp8OpfWXDX06
         trNH4N5yM06tMakoBgjFiFWd7y8n8Q5vYzGe2sYSsyTHcrl8bkFyQ9dTEG2TzThnsv54
         kO8dKVd4lN9JrTjkyeRTYL228FB/yiKUDOdoUJRPTMIwSi2VsOsu3tw8rnFajq0FH38b
         jGrVNYDZaYP2piCzdAIUgxMhE6YB6+LtWYcI6x12FqWe9qJVxuuVFzQ7gk/WaZ3LJOVG
         mu4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966484; x=1792571284;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X/S5SRmbTexKmsjmoZdpsnlp+I+xKbH89Xqk3Tt2TQo=;
        b=J55S5vD3zmtjx7lQZxRE/NV751h8bT7DIfqR3Un3eYcz3FFwGR22whTtCZeTFAcZ1o
         eLkpARyW3ekfgASHgBGt5ygFG9ErDdO3Tc3jCPc58wvZbuM/Aa1T2pxJfV1tKyXZbcgc
         GH7CtAedrYRmR+2osHnXnsGB2tUlJqWMXpM9FVmgsQZKAMsBsAkoJc3G4YXfQgPROX1x
         xOjqQilv4WsJjW0IaYw659dWjd7oQGJisUD5MsPksmGaZfBp6/iny1HDaaiE4Lw8Jf2w
         c5UABMo7/JN0Un1gJsbDR1PyYCtYE41o6w/6eo4BMN2RA6xlRw1/ffIbQJTlXenH7VRK
         9Oyw==
X-Forwarded-Encrypted: i=1; AKwUvByiOA0hQ/gXNSxS6DPhRw3AVFDvpcHIa4t+XPQA0a+yY30c9JKTW3ntr0M/KwjVTo0wKjN+x2ivICmV@vger.kernel.org
X-Gm-Message-State: AFq9FYKzJk6G4AkfS6s6l6+tWzpb9Z0/XXO8BQMz1zockH9Ow8rbDI0p
	UZh27+vZdXYHZ0ZQRGyJ/P2ctUYhwlYE1NTAZeSf5bmF2Kbpi/mgv5zKA8FNhqESaA3SSBGRKLB
	4SE+pVeM4Gc0C0IkaxeP6T+WYSADZMTREXSbkuO9+r+iWgJkWmrBNE4+J0mKtLPtC
X-Gm-Gg: AYBFou0J5N2QFuSfMsPd2+TaBrKrI0DWKe6v4UTzqhuKkIoM7HMK9CgbSSVeWg8szMg
	jUM95YGJqJkqc4zl4s9NbhIKdrWWpWGgXwnFG0ihkh/6PborUMqCu3whF4TCnmqK1qtVHMbv7Qe
	FRBAzey0LPOvefafNksORArCwceuQM9oOt/awgYmEfAD8j3tJILoYYjC/gduHHwIn30L94qTcJ3
	A7GM1y8M6KjyeSmxYE4PPc/DuUv7gQnAom5fcpU4Z50PoAfc1k8zhQajxoXrvpcQidYT6OJBcoL
	z0zNzVcf+IrPdU2E5zneTQYKDozUga4x8CVHRQGSL02Jh9AIf2TR13OZhfQ0HNWjxF4VI9eJ+iH
	vRexmNF3daBTcDutD
X-Received: by 2002:a05:620a:4010:b0:93e:e1f9:4c2e with SMTP id af79cd13be357-93ee1f94f88mr1234645385a.5.1791966483473;
        Wed, 14 Oct 2026 01:28:03 -0700 (PDT)
X-Received: by 2002:a05:620a:4010:b0:93e:e1f9:4c2e with SMTP id af79cd13be357-93ee1f94f88mr1234642685a.5.1791966482859;
        Wed, 14 Oct 2026 01:28:02 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0514ab1sm13464144f8f.0.2026.10.14.01.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:28:01 -0700 (PDT)
Date: Wed, 14 Oct 2026 11:28:00 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: ipq5210: Enable interconnect
 capability to clock controller
Message-ID: <vhqpbhknc4p4syz3y7jyeesg2vqsrcakv3p6r3tnla7v2kr6c5@kpgsr3rmhjvx>
References: <20261013-icc-v2-0-196b219e25c1@oss.qualcomm.com>
 <20261013-icc-v2-3-196b219e25c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-icc-v2-3-196b219e25c1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzMyBTYWx0ZWRfXwZ2LGtZQZjKy
 TNfR4vfBTnk1dVnq9NYMvswKoIzuJ+fA4sxWvvP3I5004gW+YCd+0ij2AZ0uN44cL/3riDZbTe+
 G1TYdSKbOA0553FNR0jXOyQLeElJ2pdLp9MI+MAuLi9MiJMyNKs55r2oZWFwr0poiKfJZR09z/n
 YOwIH0WPBi+NKGHvKbHllOBk/e5eNVnaRLHOVKjx3IkF8cq/AvJPMDJf+H2Qr5y+68nwNOg8e8H
 t8bo0qbyhNRwDAWBhNR5IVE1YXKHe8iZYLAN+0M7ICBF04CbFJcDLKlu1DiLO1NDY0pLrAazWFu
 LOcIMd7JyDzIfLiingBhpuh/5yB0mGFt5QgUp5suUa22V8HkaOsRnN0DZnzjaGamHXhbSsnsjHn
 iOEpbQJ5bNVF+F9I+v4DNyJr24Q+zqs+E+10bji/25D7RT7f3i7gIUItlh2kkhmS+ufGSqZkYa5
 wHsz98bMz36CQ15IPXQ==
X-Authority-Analysis: v=2.4 cv=LPPz05W9 c=1 sm=1 tr=0 ts=6acf3d14 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=x4xV_kGm9pRGdifk3eoA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzMyBTYWx0ZWRfXxHjXX46HnX1G
 Odfyf1f18HOv3HZeXY8KDgUic0BR+EP6ZcaxjveO8IxcJbnIgR7DpS3ME+S16NQleyvUqYzvyHn
 dQn1bPIQLAS7oTe+uEhOPx5JMo+Pd/w=
X-Proofpoint-ORIG-GUID: 5G7VZarTvL3tP-SDm7k1ZfsMtFWrl08q
X-Proofpoint-GUID: 5G7VZarTvL3tP-SDm7k1ZfsMtFWrl08q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140033

On 26-10-13 12:39:45, Varadarajan Narayanan wrote:
> Add 'interconnect-cells' to the clock controller node. This will be
> used for enabling NOC related clocks using icc-clk framework.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
