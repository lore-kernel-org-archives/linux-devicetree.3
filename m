Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE96D48424F
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 12:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782835; cv=none; b=bOisSwx86UmQzG8ShWr/2fF2Y4EbpH5S8ZBcVOoKhINxSVIsA6p329wwK9YQ9FCH98utTGYsXOaR+OqQSu3yNnTeWmURcY1KUWWXtVvWBcGg0YmGiwMPsPXeJ6iTVt0qeTZmRQOXM/gpTLSwONitqg6QTFRmTM+TdaS7yDQwVOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782835; c=relaxed/simple;
	bh=7kcSCEtVOEUv0Ni/5FamUY10RZ3Mgk53Zf3t1ATeyMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Otwe3MjeDOqpNN3/Ws066oXEIW7O0honmCNZnGbCy9Wdh4T+amM28XLriVGjP96PJK9aAkaODJ8cJqbqc/lCn2iZOYpAAqg1G/SjMtHs+IBPfF5yqrERId973R+lCZcvJfPYgTRy2xjMUDjycdqn8ExoIdYD80e2a42kxiKUIgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JX6784Is; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MlTPSFxE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JX6784Is";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MlTPSFxE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnApP4064250
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 12:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wf0IWR7cxrrvTUcIHcOkfdb7
	faQLpMJ7xtLjKtNIni4=; b=JX6784Is2b+HK48Q5wqjy7QB4WmO33wMVDaPiG0I
	hzL8SF4qELYPFQa1CerGPSfzophYNvqsEX68lskJp/JKIktf6134JH3rg1Lrl/+T
	RDdoEZ7vY3au17upRU8XF2eRVvHpOChehunkMSz1ziKbQ1iTp6V19Tjzz8iZLOVe
	qbllJxfFI1sjRM4XmqHY3sQZGTR/zuhdmxn+++axdtx6oEPvF9p/JtSh2d2Y5JYI
	OzseqR7C4QxPRvgf16Vrfqz9sv5z3jZo9ZShXZVNDUhX4HuhQCObZJTSTp0HQv1C
	/0LCaT2u2L4P7ANVJkn6BmC6ZTg9/ks1LKfXqv6ZpeXudA==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghs86s3sn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 12:07:11 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b1a3f01d2aso4665900eaf.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 05:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788782830; x=1789387630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wf0IWR7cxrrvTUcIHcOkfdb7faQLpMJ7xtLjKtNIni4=;
        b=MlTPSFxEAgT2PDaCpBCnxjOqDvxjm3jH7wVBPU4wl+nTVcBSb2fm4uTPg6/LcmN/0k
         CYuhcS7Jlmr2mKncVfaTr/ipu48sEiS7QIFRdunGQvFILn7wmDpkbHpC0IbE5oyPZp6Q
         T6PABO/JeCzPVYdGnokpRZ8WyvbdlwjHmbB4MdcHXMNlizmp4uTmXUKYIXePAl+PYd/2
         ED6dBKyLVqIUosg3sOFY3clT7yEzJdPp+dUPfoe+RPVEp4NhxnFL15Nhq78EN01DiS2P
         wUMcKiWR9VYz/RzSLYRORh0njm+A7FXY5qk0a4fNJBGSgZRTns6OOq3QFxpWrNyv8Xcj
         jiPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782830; x=1789387630;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wf0IWR7cxrrvTUcIHcOkfdb7faQLpMJ7xtLjKtNIni4=;
        b=ODfQzi2qnfrexIjQvSvKoWBUtW2jRe9vbHQ9nXqMzAMPWzZwysuWefsbIl/qZsCNRQ
         +5cuW5D1iLk8Rwo0s2069tvCoRe3d8dk+rVYxEuegJBrJsghgeWk/wRb+HPhVLbPs2y3
         CKjKwilPqIFMgJ9XIzJDaskYEaP3tdXU00AuKQtIn3O9vX1ezjAPvxeHOHTwuAh4deMn
         QHWiA+PflKGp6pFvU6n9JOf4RRs31DO5LlEvTbU1KM959Wo599viFS48juiKZ9OOveDY
         fm1+cI6LKN9mpAfZ1MVux9BxM7hYWDjA0cEpVAIUmxrPBcdG1XvJhxtFDbfbuMeDx6uO
         CngQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmze4pq7usXXFARqr+Xs7YXNFoV5/08i6JLoxvpRvL4vcGU9xpfvk6fe3gGir4oKwBSaA7LmEa1ad1@vger.kernel.org
X-Gm-Message-State: AFuF++nrTra8H0+ZYcdN7q8oAZfnK+IXN6qzf8/PKjQivlSezm4cJR9d
	B3Eg80crI2hOleDbB+kOb+PkDqsyzdXaCrWH/PCgBEevUYPsPT8sFhXOi5qI3iuTWh6MX3YjRMZ
	+h7RHgywVPk3KyF5ZwmBnNf00HdVGdSv1iS/gJbuafU5rrH8/0mo2UrVZe+h59XrM
X-Gm-Gg: AYBFou0G7uwVWKSvAwDfyoh7Tn++bhthlkzeTvW2HaxaFUo+wdDgEdxJXoTQBOv25Ju
	bmec//97qomYDg9Zzg1MTQ107yztSwDwQCENYGley67EuukjrdiJdfGnFC8vygs1EAF65p4LCx+
	HeavcYtTMr02MWtrqFKnfWb6XuaP3HlqJk4QuNfa3ei0+9rIqyZGmJJN8lg6aI/cpapt1gPojzt
	E2JK5Qr5FMmZkHO2alSxw0JT4FIbkEYvnBiqPmFp6u/j1PdMJ+YcTxJK9yanZZH/RSZZmtEbMK6
	TPKZ++O/HrPnirGX9Gs+PAIu7lCx/JlZZd/NqYa7mA5GzO2eqysZvbMDNRiB96y1BuaUAqcIjy0
	AXUK3VQFNanbL2KrzgGtK3dK1MAEEjqwkF2R3sVeu2EU=
X-Received: by 2002:a05:6820:208c:b0:6aa:e573:9ce0 with SMTP id 006d021491bc7-6b6fcbdd780mr13557476eaf.16.1788782830599;
        Mon, 07 Sep 2026 05:07:10 -0700 (PDT)
X-Received: by 2002:a05:6820:208c:b0:6aa:e573:9ce0 with SMTP id 006d021491bc7-6b6fcbdd780mr13557442eaf.16.1788782830136;
        Mon, 07 Sep 2026 05:07:10 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33688cfc714sm10567924eec.20.2026.09.07.05.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:07:09 -0700 (PDT)
Date: Mon, 7 Sep 2026 20:06:57 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] arm64: dts: qcom: nord: Add remoteproc and PMIC
 support
Message-ID: <ap6o4SRb_4dG97yD@QCOM-aGQu4IUr3Y>
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
 <f9252adb-7b5c-41c9-8a2c-fdbda21d672b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9252adb-7b5c-41c9-8a2c-fdbda21d672b@oss.qualcomm.com>
X-Proofpoint-GUID: RWWPy-YQAZEwB6s1B0YLbG0Z4hWX1IMd
X-Proofpoint-ORIG-GUID: RWWPy-YQAZEwB6s1B0YLbG0Z4hWX1IMd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzNCBTYWx0ZWRfX6yT/p4i476jc
 4xkdYvLy+T0e7PvG0i0eGcVKPvNufbacCQVgmaPpxx455srcjDDdULbOtqEP0/I4UL4dT/Ttjln
 ZBksaUVk9GYfaIE/MN6/y64HikQKZLQ=
X-Authority-Analysis: v=2.4 cv=LseiDHdc c=1 sm=1 tr=0 ts=6a9ea8ef cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=C7I3bfQ-aKRSAYMrKV8A:9 a=CjuIK1q_8ugA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzNCBTYWx0ZWRfX0+DIHBBW9weK
 hzgIOHYHk58SvImWyNpUweBM88yWnYILgcGpIAmx5CNNWlQ0FGtsgcnUbY6DuaAoW68C98xYPak
 aOXR5JryZPNwVlog1qBvkT7szX8WG9xNd6+17uGeYCQF9l24bNgk1ie1+XKWTpnQG921Xqb8gWN
 YBgZjgIdjPmw8Q9WgH1O3Y9T+/qrTGW001nWlXNSFceVSqj7CBXSPN59ucssYznpey4kwv9FxMk
 PRoCSZwUAUBf006gY2RwABOU6luxdJAB+FtTncn8eWCpX4O+fk7nZpaQ1u8hjvj7Bciz9GBvTf3
 m9SEU2t7YVFXAcHtISKyCgHReYbtE5r2SqqIiMYHY6dWDQP5jqkVOx/PdQiuujC2xJFVddy2j3h
 pqp2KwEmgQOM1wBbIq+IJKMDfbUoiefF4z+0Ca7cmvgDxb5CKIO0E3y2XZhPbwEpdHUGGIs5/PL
 WRWlGolxUh/5GfuaYAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070134

On Fri, Sep 04, 2026 at 12:00:40PM +0200, Konrad Dybcio wrote:
> On 9/4/26 10:16 AM, Shawn Guo wrote:
> > This series adds ADSP and CDSP remoteproc support, the SPMI PMIC arbiter
> > and the PMIC descriptions for the Qualcomm Nord platform, and adds the
> > initial device tree for the Nord Ride Embedded board.
> > 
> > Tested on next-20260903
> > 
> > Dependencies:
> > - NMXC define: commit e484a765f543 ("dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index")
> >   from git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git dt
> > - Base DTS: https://lore.kernel.org/all/20260903140617.441111-1-shengchao.guo@oss.qualcomm.com/
> > - PMAU0102 MFD: https://lore.kernel.org/all/20260830034719.140213-1-shengchao.guo@oss.qualcomm.com/
> > - PMAU0102 thermal: https://lore.kernel.org/all/20260830101025.191697-1-shengchao.guo@oss.qualcomm.com/
> > - PMM8654AU RTC: https://lore.kernel.org/all/20260904074541.590485-1-shengchao.guo@oss.qualcomm.com/
> > 
> > Changes for v2:
> > - Align PMIC comments in nord-ride-embedded.dts with nord-rrd.dts
> > - Drop unneeded regulator-always-on and regulator-boot-on from RPMh
> >   regulators
> 
> It still remains on something like 40% of the defined regulators
> without any nearby comment justifying that - are all of these
> intentional and necessary?

Yes, all of those are intentional.

- Supplies of LPDDR5

  vreg_s1a_vdd2h_l  -->  VDD2H_LPDDR5_01
  vreg_s5g_vdd2h_h  -->  VDD2H_LPDDR5_23
  vreg_l1k_vdd2l    -->  VDD2L_LPDDR5_01
  vreg_l1f_vdd2l    -->  VDD2L_LPDDR5_23
  vreg_l3k_vdd1     -->  VDD1_LPDDR5_01
  vreg_l3f_vdd1     -->  VDD1_LPDDR5_23

- Supplies of PMICs

  vreg_l8a_1p8     -->  VDD_LDO_XO
  vreg_s3a_1p8     -->  VDD_PX3 
  vreg_s5a_mv      -->  VREG_LDO_MV
  vreg_s7f_lv_sub  -->  VREG_LDO_LV

- Supplies of Nord SoC

  vreg_l7a_1p2     -->  VDD_PX14

Shawn
