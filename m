Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACF342A144
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 15:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789227336; cv=none; b=oqeY2Oh1mfuKEhiI1t6aD6l2uIgbq7aYiPmmkvf46xLQDmOU4ttAB58QPdFTCWpMLfkxEsrBazOfBZhndSoq2gxqWiW3TQjrmBjGhJMUiNmlI1UEQy+IbYjdHkFscH7UyRjBjsyOB5dUuf8cryP5tbnkGuFNgBIBVR8MNyH0yHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789227336; c=relaxed/simple;
	bh=PmM3GuOb4qCxP0wGBV0CweejIfEC62Lw4X6JO3n946I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ov4WKzW8vRGUfXvGB2zWGEhRuUnEGS0J7dxO8GEq57PwWQM8gKjemvg279EmFiF/LWYm48Cc6eeXXjoTjB2Axd0dD4sOWi51B9ny6f5tXHJqJG/6zzq5b3lBcaXnG2JfONMDhzsfevzJ4lgF7yg42RXN2LP1g1zjRYunay/S2Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wj7XlrGu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KBXFGks5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wj7XlrGu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KBXFGks5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEdqHt3828433
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 15:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4qI7wGsc1uSi/6ECowdkd+fJ
	KuFNHH72PcdaBvULfX0=; b=Wj7XlrGuGHnIc8Ed9CSU3mc1gyiHMJHlIxhH6vyS
	RqK9aaUdtX5VrxLKQZNxnoDz/6xHMkuaFYr1pLqHPQ1JFK4DkoPDr7eEP97jLmYy
	HuuQA9gLjnvCXD/yD7kVE4H8kb+lkhr8YFcba+g6t8kRD9fgyyfYuiAGUpge2IWF
	H5AHtAc0gvGT5A0HZB2F6kKld9klWxevqc36xdt4BQkuObTlLAu8AISszhcdW2A+
	qdxHXlsc2HRWttiUot154Ic140O6tCw2Hl3xe9AlLBaUaP2M4DOYpdWehV+7K82U
	yGms54+OugQ3GWYP2eAe3Ti39metAUo+ZQKZV9hpinpPOw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dh9au-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 15:35:33 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-912054a1c29so20437576d6.2
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 08:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789227333; x=1789832133; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4qI7wGsc1uSi/6ECowdkd+fJKuFNHH72PcdaBvULfX0=;
        b=KBXFGks5sgvXLgWpvFpvnopFroMnYHAzU4JpkPcE+3Lgv6gzRswTt5ZCBNfRmy45Zq
         JRogRNixnzLBaLrkU1Db4d+BXzzLplw1wLvOEorGOAVEdYSiJxYdgblvSxkVupG0KJxx
         QvlwaGYkF38ecix00yL7kK35dXYPgA+I93s8aXiRCCErIagdL696JMvWBoViJZlw+2H3
         z1bMMtC6r1EHhj4fGFHgHQ3IOL9Wh2yXTUB5tzuJl4xR9U8HgDDQNHITN7bjrteFO8Ze
         Yft9zd8igv/DHoFMlH7DxqmL3snn5X7TINS4++zR6FAauvIHPYzB6wUECgdvx8wS2RI8
         m1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789227333; x=1789832133;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4qI7wGsc1uSi/6ECowdkd+fJKuFNHH72PcdaBvULfX0=;
        b=HFF/CeWbTo4yR63Al6um6QGA+2ATtNs1v5PNWrV2B73ri4XXyYUHCej+W90vfNt9zm
         uhe/3BnVvUsBx3/FoAlosupP2+nT6bvTZaJXchoPwGTOMuIh0Cugt99aakYczjaHe6C9
         dveRrPWp+OrHx7fhn2HPv9G2gf1mq21UqSh+VpD6Aa9SuHB9Zv4y7CzdL6mJitq6dpwN
         bBq4a9JNGFai59aAOYZlfSDwxmbQvx9yoPB7mObWYWjUxDwdMshtgzFaU4GjFrhZv7A1
         H1Cvd6OMnqm/SJnGMeD60IAlmVMu2kxj6L2Xrv9WiP1FA9zPRRoSyYhPNnseNMuJyMtF
         cXlA==
X-Forwarded-Encrypted: i=1; AKwUvByA949xuRuvbGlTFOVQ5szxL/N1yr3Hn51Hw1Y3JXnRyVlZRSFPEd42yzkMyWV8Hg3b4wjrdGs+Is0L@vger.kernel.org
X-Gm-Message-State: AFuF++kJIFoCNQtPLUtq9WouiFllUyiDrqx5buqtfs+o+UzSt1z+4aSl
	wioQnqbSHiRPKyFmlHKATIPA1O1ymoDmYKPjKkj75IYTnSJWnHsAMmwr6J7uzECtWmmQMPGWO48
	66pPZlA3XAoJqDnoAMB8nyS7oTXR90egsjd3Y1v0kXkmG4Hy4p5L5yWpqSYBSpS84
X-Gm-Gg: AYBFou0eg9gJWnHdfPKMZcw5VAx9iEMy9hhvVFfGPZ5/15MRUeNkLxEuN1kAQc2L2v3
	bZcMKinUNvyvEd9izD7yqccSJ5Cgc8drBxTGgPILUrrN6fZbEsQr919B5YPr01MuSuBZfDXNDoK
	dQEPnZ5Vbe5m1EK73vBWiPFR7aPKLiZtIPypBPRruT/VCJUjGUUtFmunWsgt9VwR6V4vWf1RbN3
	6o/eYKYwLJ3NWtTcSeO5uGiixpLQ/+DCSn9GnfPtjM4rf2RRoicB2YDPakrSPsU9ae0Nwr40Y0L
	jK1zbFgQAhCmhd/Gy0ZmHCzow/j/FpEnl7Yp3B+RSy5+VUgmakL4FkrkklS8dlfj60a9x+DE+/+
	EuUuAge2hUfT7Sns=
X-Received: by 2002:a05:620a:298a:b0:93a:824:ac8d with SMTP id af79cd13be357-93a0824ae72mr390565785a.27.1789227332620;
        Sat, 12 Sep 2026 08:35:32 -0700 (PDT)
X-Received: by 2002:a05:620a:298a:b0:93a:824:ac8d with SMTP id af79cd13be357-93a0824ae72mr390517285a.27.1789227327401;
        Sat, 12 Sep 2026 08:35:27 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaeefsm163445925e9.12.2026.09.12.08.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:35:26 -0700 (PDT)
Date: Sat, 12 Sep 2026 18:35:24 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/4] arm64: dts: qcom: pm4125: Add VADC and temp alarm
 nodes
Message-ID: <33u55ckzcs55fq2ioem3sagostq6c7qnrqjjsuapjangrogopk@est27ed54xo5>
References: <20260911-shikra_adc_support-v6-0-e4b2da5cd55c@oss.qualcomm.com>
 <20260911-shikra_adc_support-v6-1-e4b2da5cd55c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-shikra_adc_support-v6-1-e4b2da5cd55c@oss.qualcomm.com>
X-Proofpoint-GUID: RlP89AtnFJvnTEDs6gVSLAP5uXZkGJcY
X-Proofpoint-ORIG-GUID: RlP89AtnFJvnTEDs6gVSLAP5uXZkGJcY
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa57145 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=cnYp6-ZCE4NPyVZBhYIA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIyNiBTYWx0ZWRfX31rMREckMeSp
 nBnCK3O6ON2nGgDrJzcDwsNfBHjEgF/DnRO6qs0zRqtesaYFUFAzy9EQiEdyKtZ5iqlmLzmXyDH
 VuIAglDoCQSdQoYTgfZ2zt4c7/rMcRY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIyNiBTYWx0ZWRfX7INceht7ThLo
 HLF4j3lbcmDo91CYY5tQzAp94KHq3/BVMLESlQUvlBjbqqKhRH6qbjEEOXSZ01OY+Xlt8WPhNHY
 m498Ky5gw9lRRodxOUzlTHmaEmlZdTcBLNXoolURrWB0cPbpXXKnYFy3+6xpFewfoIt5Ed3nthm
 zNZrG2ZULHb3FIP3jgnVQoc2VbUW9f3IKNLMSG1spK3DwN+GN9y73VRADR8JfkCygyvXP2/8eqW
 WqUefUAPYCIFH+6JrIj8d3Qih3kD0zkhhV5C6E23uT297U4uC1zm379rzBFXbhWQrtpFbd1DrEO
 DXlBUX1PsyRRssQMbiOXxHDI0OUmqtLnf8uq4tAOfm205ZkDb5MSU0ak348WIz2Gz5Hu/cL2Np+
 h/kHBuHiqU+UhIy++ov0xYNzf6AWCg4M4vdVS2m+2lyjc0NIi7SSFNb5Zyfcwhr5IXCBu9Un7Ux
 keUUh5++CbZ93MhBceA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120226

On 26-09-11 22:10:39, Jishnu Prakash wrote:
> Add VADC node with some channels under it, for voltage and
> temperature readings. Add temperature alarm node, used for
> PMIC thermal mitigation.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
