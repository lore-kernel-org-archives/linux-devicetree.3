Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4FD489FB0
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329701; cv=none; b=Pj2rTRjM19eGZC4c07CYtGhb4exec687C5U5EioJSCp+hD29ioQjteGW997rV+t/wgC+Trjz1mZtShNQaCHFJC/nMNVmUzgt7C8ObMjS3EZWL8K2vsMQjkEwpKm/uLW6qhLgVKsqbVT/+jqRRzYtUdhTr93761Y+5kSqGim5mZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329701; c=relaxed/simple;
	bh=88IX1tmHXms+pmBDY4fQ91nC5iyYvEp++1JbnZD9ebo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rwWjsKImKPQ07hTxOj5vhk9eZraK+K4jYheszY2mPgjNu2YOG6pn/Xp4MtFLCdI9/jtf+NTrxxcdkFaN4eS1+5TcQ+upJkUF1mDokpHLj1hzpEoIJ1yDnljQN8IIokWKjUE8tbY0Tk2bjALJq+pNtXsO48Pb7i1T1sAZpO//H3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dse2ZHvm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NNgOG6Ku; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dse2ZHvm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NNgOG6Ku"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YTZr3736787
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bKpKeKCtxn641s9Sq4IOPtWi
	CTENHPj6K3Ie8LJNauE=; b=Dse2ZHvmbRwKbQP7R+1JgOqw/uBIw700fb6P7xrE
	ddICyVpmtmwVTC0x6X3jcTqEf1wQp2D130IE0unoUC54pIPv9+eIRYW20gyenzLh
	9kUvJOJltqYj2j3r5RBktiMtXDaGB/JDeKKGOHovw3Ot7F8bqVi5Hd4zs9FzdUu0
	IukVBdq3eCM/vjYByd0LdPj90YDHoFeYFvn5bYaAkKLv8oAbV4gy7DKdfnVb+CzZ
	2qc0erk0CZpX2ApbzUWtNzL1WTuUQnbnE9zVtW3W3iorMW1hE5WKPPkVyhG1zG6R
	bU3YnPYYdeEihgT9b969GZNHyn6R2QgJj9kWUSwDM3PUsQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw68e3m06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:48:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so135233685a.1
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 02:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790329692; x=1790934492; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bKpKeKCtxn641s9Sq4IOPtWiCTENHPj6K3Ie8LJNauE=;
        b=NNgOG6Kui08O0Ir6IVebm562Y1t1OsoOTzfAAca8tqPCwQse8qHuxU0rahl2t+V/pg
         gwcm547UYOgI1OAzaV8/D+r4L7QIPi7maXCp4das3aSZ7UU/j+BSftGvz5+BXrLws+Zl
         9rQ271FuBdM114BpU1rAyet5D0buN2PsBQo6Adm6KvFg6r4ZXOMJ5NoR7aAUNXpeyUox
         vSESBKRaaFZBgxzSzb2M6GTj7x/5y7vAbvtJy9ArAM75szpOb4vr49aatxJFBz1OcQ4x
         cuitoD2EtJPQCgIW4ARU67QEXKirWKCxD7oe/UgdG9YpnCytMRe5cLmUJMIY0kH1dl24
         x+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790329692; x=1790934492;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bKpKeKCtxn641s9Sq4IOPtWiCTENHPj6K3Ie8LJNauE=;
        b=mV1qi1SSX8QOY5+5sBO18eL2LC1I+srid/232NbFKj85fvFjInuER1amiR1dR+z8me
         Klo0a/OuUhPiB2H4l3EMzdngdBQwh+8rocz3cegj0Qbb0AKCY+WqvgyF446hHYczh/6N
         QknaPoQjuNsVjJGYIDvQFg2Dly+XLabOUxr+2aB0mKqNvmw7J/Eo2oBDn0MTiMMxKzPB
         aTNgHu4tB8pGxz+5y4s5iIkvnCGRJ7y5kzm7mZey4/Rw/FVVQEDsfOtOVR2/kRStA0xE
         NRY6a28MJUnNspJQvBM1aBnej2vxnvCsYZX/2GkVVBhe+l8OEMiYH/tUalDc3zwdCJMQ
         YwIQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3JAyldzzykvfGGs1287KLj2iHE/SZ1R+x/tYxY80/mKlCibvhBNXEcgz+9tJv9lYLotPB2kvky2ql@vger.kernel.org
X-Gm-Message-State: AFuF++k2/O0D7Tc5nQHMHIwEHBStndmWJ1HtslhsUq9M8e/fnTbKJfvB
	AN+8sKM5Ug/X5xwmoigYm55bLvnkh9/U0dgkKTYKF70AeDwAiqHB0ELFryL+zDnfACVg1eekoS0
	s5r4ht0HEjhOVlgrH/9Mp4uZpFg+KvE8dfJjEv0wk8Vn89rCSy3JtWq1pIbWUtOSk
X-Gm-Gg: AYBFou1WcCnOLUACTQWh4YSPNOY82cj9SrVLQBiOVO2VeOHOe2xRP4W+2kv5fA4pr0M
	YvmdoFmqie67n+gLAUkc/fhSnEBCo6eaoTInU0oHHBmLL7YfnDBh+J1tqcduEEelsS2HNEmS99y
	/TftcEuLWAAE5PIplRXj/P99RUBHQim/6Tznrl3pZf4TICNfLtSlD48qkTbr2e5X+Wf6m9ibDFN
	B2q2nGCPbWstqMAJnTzX+TbBed22RYx6acYPu2fGiFYaPvjSWAPjKzWG2vBw4QRyzjUU8NiR3yV
	jWDA2gFNm+I1iWopqdM2z5cmBvpFNF+UyaukzrZtVWI0Cf03HUy5Mzlifwdp8lbmK5z76hV4pE2
	TYwK+M++XBuG2n8g=
X-Received: by 2002:a05:620a:370a:b0:939:c7dc:8712 with SMTP id af79cd13be357-93c43c51d50mr347262685a.15.1790329691567;
        Fri, 25 Sep 2026 02:48:11 -0700 (PDT)
X-Received: by 2002:a05:620a:370a:b0:939:c7dc:8712 with SMTP id af79cd13be357-93c43c51d50mr347257885a.15.1790329690987;
        Fri, 25 Sep 2026 02:48:10 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff2884552sm29134755e9.10.2026.09.25.02.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:48:09 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:48:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: glymur: Add videocc sleep clock
Message-ID: <nwpxqyjjusepqubva4hsf7e2wfvvigz22p7yp6c2tblezz7qj6@2s2tmiggu2dw>
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
 <20260924161152.1162301-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924161152.1162301-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzOCBTYWx0ZWRfXyal5INYJrtE5
 LL/fS9msSo8ezZBDAKOy0ixVxfmjBuF4osVo1ABFG9tCw9ZRywTs6XPQBBAMP4p0L3bSLA3SMVS
 wuxeRI1tRhSEvlQxcRYgymYleJszw4X0CWX+LbHACvOv9oBXuxIYt/qeARC24GgM7AQ96TxT/Jl
 tUs2rfujb3dgSkycRsNdWECWYDsK7JUu62UhZERpyyBJ3YbxEHABaSjIrll00oBFsPhBIO75lcP
 IgOPAf6zdvxig4Hh5BjhIG7nA/KgUgT1GCJKjHq5wtTwaxAFmgAYHxC4QOagP7wra7x/Ld0L32Z
 QYXBGnM807C7HByIS9mLGBDFB7WBf5f89GxB5c/xYCtDSXaYHcDQIKYFB7lotEK9ILRuAaFTM8V
 zfcV9ESZIzah/iexestBQA87CwReW/I7Wfn5feSVO5nDYTRM/Fwm6ZLR0449ghaW3OWga3Qp31j
 peZdXrY/bZzhilgoTiQ==
X-Proofpoint-GUID: QYz2Aahny2YOh26J6o90Ghgh8mdB79Of
X-Proofpoint-ORIG-GUID: QYz2Aahny2YOh26J6o90Ghgh8mdB79Of
X-Authority-Analysis: v=2.4 cv=XawcX455 c=1 sm=1 tr=0 ts=6ab6435c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=IINBPA3gYupw0c5GNbcA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzOCBTYWx0ZWRfX+Acr+KpbU3OY
 jX0ZxdVgR00Kmpg7FQfsFxk+jKgPXgIUrVe5Sl0y4ghAYkcdHgDgej6Bp9ZEe/b5oLPDe/TM0eL
 XtKSnocGnsoLV3u1Fmxo7qc99FwjNuQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250038

On 26-09-25 00:11:51, Shawn Guo wrote:
> The videocc node supplies only the two XO inputs. videocc-glymur.c
> expects a third input, DT_SLEEP_CLK, and uses it as the parent of
> video_cc_sleep_clk_src, so that RCG cannot resolve its parent and ends
> up as an orphan clock: any clk_set_rate() on it fails, and it shows up
> parentless in /sys/kernel/debug/clk/clk_summary.
> 
> Nothing is broken at runtime today because VIDEO_CC_SLEEP_CLK (0x8138)
> is listed in video_cc_glymur_critical_cbcrs and is therefore force
> enabled through regmap, bypassing the clock framework; the sleep source
> simply keeps whatever rate the bootloader left. The orphan still blocks
> any future rate management of the video sleep path.
> 
> Pass the board sleep clock as the third input. The sibling evacc node
> on the same SoC already does this.

Same question as on the 3rd patch.
