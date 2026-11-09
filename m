Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214020;
	b=HOMwzeiudqQ2JngiEBN3D2042ovn+IXaqxMfO9fnnZDL6+cb87lREqBhf2HolCeKvbDz
	 laYCLDl31LBXkjhz9V2yTO4udwkLvKRXcuUSvdsn13AtZ8ldmJxJdzEUmwBovcnSx1fmJ
	 L4qMhP5YQ6RaELU+jcV0xHQDMYJyZojKwhQ4IJFf35EMwbpaR91+omyAW9PO5qmkJwmmA
	 IM8hOSIb4gMF1GtHnEnwb9+8y+JekofNMr+Vx6BMdBiR3e/KSoQiXLYNocR2RQcZ0Eygt
	 ohEvg7hNet73fFNMg5WZC+mKqnYGyxmwx6lrT0EcyUOede/JkwmN2TBL92RCiv18n+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214020;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=v2huvmdc8Y7zILI1SgjJfTFpWXV5Q8d3nrEA5tfFZCQ=;
	b=cqFZZaRGAG60RsFWJoksl4gPdzcrspA6Av3zgNCC6sauUsLNsKUS5Up+EWdIo5vYM6cI
	 DDMjqKNO5ATSdzE5tOfuGxJ4LvsP0O7NlMy+Ui3+75gyDiA+1gYN8wxr6BH59e5ggl10q
	 5rbfLXhshcUe9fvnm9J0wPRrLgXoItkZ2kackp4MIIu9WyHFCDbeu22exPcRhjkV5roVr
	 mM24Y4g2JVplTkL+kISxgyH5cj7z/UPJOULsFqJqfHFjJUHw70oeCn39edP+vatOKT8iO
	 anNaj/5iAr2O9huX7KAhh72SkT7RzVn7CiaZ3wBbnd6t5q6qycCQb/99eMCNwwP4dgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LNta3G6+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MTTKNEuy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AF2606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 08:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2AF2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LNta3G6+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MTTKNEuy
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A0v93611057
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 08:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v2huvmdc8Y7zILI1SgjJfTFp
	WXV5Q8d3nrEA5tfFZCQ=; b=LNta3G6+vNq49vsha5Dm7qofdiX0TFXxieRRNgrf
	awtXi4t5otY4knjAvKlqY1wZ+U26SQGKiS4LXHBzRrcBkZYYBPyM6+9WBouD8qke
	Oe+8QaSHsLCTVfcsng8RsHiZq34HMvPy/wO7sUWZ2M2kFvkLgWmW6Q9wmT6Hb6KZ
	DFGxNFoU/l6n05oAG2+DyIqoQiSFnMNKx84Wc9l677V+7YUrb9e1UguEycIi8M02
	W28a7BUden45rwwCF9se/jZw5EzpEjrzP0KfIQx5HK8WGPmOQr/QrZ1gL4tv6AlS
	QJ4WacI/tiOhc87hycgafowvXhc2vzTFHeNRbbCqkq254w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnwwpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 08:46:58 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc06b9ca9eso8046137.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 00:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794214018; x=1794818818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v2huvmdc8Y7zILI1SgjJfTFpWXV5Q8d3nrEA5tfFZCQ=;
        b=MTTKNEuyMBqSdml96P8JXaMu8LhAWxS40XVL6FIJxjmJdXaWTwNEpFXNZyAG5UO4Ir
         dLTHNubgVL0kQ8uZ4hPc4lAF7LNybNxJ3MtRC3fJdNLNp13P03iy3hhgYP4YqUTui+iW
         Z8B4EMDbkurIteXENei9MaRPSYhKl2zA3cHt1VYev5d7NbUDRK9UQbo7jwB8s/+nnH4v
         cfCsa26vke90kGp86/uYuBULrP5UQY5KDpYIN+H4WboKugvw9SUbOerT6mkPjQPAwKcl
         7DLgwvPnqBbCk/ROqB/TLhdmm/c6Ozz67CFOZQsNT46WZabdGS3uZDaaixUXZBm4QeGL
         2e9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214018; x=1794818818;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v2huvmdc8Y7zILI1SgjJfTFpWXV5Q8d3nrEA5tfFZCQ=;
        b=Nt1LPvobft40PFcAdEIs4bLP3hrxcz9KtrBroW07z/+5zQoifIqMD29Ct2XG41Up9G
         4JyAr+mfZ2d4Htav+uYjyVAFCEHOhgKhR2DOZGX9JQjEYANVMDtUCvJb6MEgP3B48EJZ
         BOg7QdqFomHMA1YBXDZCXBh4PuSQtSp0dacm/la8f6AeNM3kIsBVfw9zY8bNzao8WQ92
         jcWA1F7JVFNW6gJoK1Nz+s/Y/JysmuHsqM55zu2MGGDUkjglFKw1hYFU2GDd6ZwDnE/4
         VH50hwbGdemkCoQQGYAYVDYDyW5Y2GAZKQ5BPMmG4Ma7/nEWj8Z5iCUTgARcUD6oJKvs
         6rtA==
X-Forwarded-Encrypted: i=1; AL+hErEC2a4dkfTF28WjV98GcDt+Ivqi4PLeUA14Bgu3gWU4epXk+yFafSYOsu1Aom4vu6yofa10LoFy7xXB@vger.kernel.org
X-Gm-Message-State: APuU4Z8adABIkrTlaATkiDIjUZz8Wp+WkByh1OgAPxTVP0KvqB8iqt/b
	rDr9lk6YgCE4XZlVlscym50eb6re/+dqz/WBV1y6LVkkl+Bjj5GOi62GFr6T8D4DG0BGnKSUmX1
	oxaGaWeDis7DmKj/4e1YYfyNenpR6djVGWKgtJKEDb/6TvWJR77u1cKKSez+D38vh
X-Gm-Gg: AYBFou06l1EGOtKRNGRX5F7+QHozfvp6OwWTrgWceLSWsf3aWGpi476ZD8DrANuJw75
	E/w3V9MMbb3SbZYz7Tx4pjWEVDmhCHn2SRY6FdYH1IEmm2bbCMLugCu30ugmIIvcsPT68CQr1Rz
	81MGmAd9pvWYEQyrXV7txZ/mEkwnGgkV03dFcFKFsFPVSQ8n4XEkSRnAEDxORTWQx7sVYxf8jFJ
	7JNNO6sX6UdIi6TxSabbD8hPyC6TEg2quoUQ4Ysvqng7yNukpvgDv3S3YTjShPxoma3fPKEA+36
	BbH6D6nUhr9/u8riJR7P320ljtyipfCQ9Mzy5kXf9eGMsxHG6duai3Kz7x4PrnchpqFjRw0PtDm
	pC/L0hCV4lNX0r4CQCntqHTXkzlcIiVBwtUVsqR7Kmu5nI8Zz6aYMqnR+pEviz5M=
X-Received: by 2002:a05:6102:3911:b0:7a7:196a:84ea with SMTP id ada2fe7eead31-7d2db20f640mr824638137.34.1794214017907;
        Mon, 09 Nov 2026 00:46:57 -0800 (PST)
X-Received: by 2002:a05:6102:3911:b0:7a7:196a:84ea with SMTP id ada2fe7eead31-7d2db20f640mr824622137.34.1794214017296;
        Mon, 09 Nov 2026 00:46:57 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597b1f969sm8482016f8f.50.2026.11.09.00.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:46:56 -0800 (PST)
Date: Mon, 9 Nov 2026 10:46:55 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH v3 8/8] arm64: dts: qcom: Add Glymur SiP CRD
Message-ID: <aeeobsllptndjaljsblmdgayckiehg5md4wlowigtvnjjj5cqe@w2bzdxofvtr3>
References: <20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com>
 <20261106-topic-sip_cob-v3-8-52cd3826ab49@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-topic-sip_cob-v3-8-52cd3826ab49@oss.qualcomm.com>
X-Proofpoint-GUID: kIXIkr6AKgo4aoMsTZI77l2Eki0Sn2gK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX6T1RrIaZzKuJ
 3Nt7pTnA0BWb5rQHL/ESNcyRw9ZqLrHoL9YpSH5Z39cfSGpPCnKy3Qg3rmKhtt11qop98UcOCHt
 f7lWv8ZdQA4eHqulxJJtspOaqu1DgGREKBG5u00tf91Gb9KLAt88/AobyuX7iGXumVjhAwlu9Sr
 v27ZTiqC7RjxU65O8PezYg9mu/NF945Yi+sys+TiNANCTEQwKE/V3SqwRuXBAeu3BHcc8OMxafk
 yl2xDfwknE6ax3ULjImSiZ5Foy+06nxNcZ17GRmxcTcJmMRj98AHV4F8yeKl1y2n9HKEev6NjvY
 +LDYY2F6bMHmR4gTaOZBxlM7xLOWZOfUy+FGu2G8E1YoxLFqhoV/wLggORDed1gQrraA7XtwGo4
 rwCh7VKLz5c817z4dQxmHWUldjP1VX0K1UO+DGLAQPGpQYRZq4YCxzW94SY9MAoZHX0tXlJVxge
 0SZ/ASCNAU1QtjS7g4Q==
X-Proofpoint-ORIG-GUID: kIXIkr6AKgo4aoMsTZI77l2Eki0Sn2gK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX3QIeKoJaSc3m
 n5mmraf6ZHFz7aCIHKmcDUf8i7t/n5BMurd1/5dQS+zk9ttbw3qoD4eS67Nej0kW8REs7w+Ck++
 3jFgRAH7zhgecqF/n5NyJUye68yQCmk=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af18882 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ocqbc99-3qkDWcjWXscA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034

On 26-11-06 10:29:09, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The Glymur family of chips comes in two flavors: CoB (Chip-on-Board),
> where the SoC is soldered down to the PCB and SiP (System-in-Package),
> where an entire module is soldered down instead.
> 
> The SiP flavor is used for the couple highest-power SKUs and brings
> with itself a different power grid. Add support for that.
> 
> Build it on top of glymur-sip.dtsi for the power grid and reuse
> glymur-crd.dtsi for the rest of the board description.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
