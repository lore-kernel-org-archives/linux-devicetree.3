Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201253;
	b=4vFnSzNV5aqwCd+0dACwOcRGyPqJ3/lePyr7LHK2bw+PsiuROQgNzapJs8fMm0AqirWH
	 zUXRRzd7ZwV3L26+ir4wpaFl2HGv8RPLdCQHqbd3XSF6GNCym5r5oM/TZCUvt9O6/r3U+
	 8e/2rYXnX5CzUxfbPyWwZVJYsNu4R4NrkiS7tRmOjztCwJghGlSNIetOINbglSf//1QmO
	 Aa9OViRONSlB83K5W2eHqBSe3KD3X0WmaO2J87Rsui6hquEuT8M7gdND7+AlR4pqLYQPz
	 x6nMGMcVPtzEJIETSzOPzA2apUvCPn7aRjyhBxwsWD/UFoSfYbQEtE/R++L8Ia4BoDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201253;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SgVHroHe26mmsC3+gKDh7oohcL6PcbX2BsXPMljkV+w=;
	b=WpODbC6gYDd1PMhysTx50j4aoOIxMIXal6iQj3wI8kQ50aDhzmOFm0OFYFLd2wlE++6T
	 Ztuap0evFPRQey+drO7xxW+VdBDFq8bEXU8qNaZje2EoLp+7zbsWr8iNWlyPwv0dYnEbP
	 GdtHNBUebJazzP9znBgr2h/eo2kfj9bIa/fsWAssiiLjYEL1gn2uMr9aO1GS4aq47Rf7g
	 ytH8+3nf0fxKrAeUcoi21FN1adCJMPHCY//guBsmR+EDtxjPqrq0yTxSlVczlF32Jr0Kr
	 7n/FJ2cTmsdGNKdtHg3hA7iodEAG9WQ2FTyxXZSbHmw/O9WkojianTu7kbpcxZDLdiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QWa4aQLQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Wp6/APDX";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB98606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AB98606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QWa4aQLQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wp6/APDX
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA5Ms2568875
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SgVHroHe26mmsC3+gKDh7ooh
	cL6PcbX2BsXPMljkV+w=; b=QWa4aQLQJ7t5Qu7+L+ovdgFII6i0DkdBnE8jX0jc
	EKTkBHl1iYmWClp38auy4HjJDN6ANj+baTwqQ//2CFwIEoHRqqVccJfShmhep7ho
	7xnRs5xyXLW9Y3oyYa6lYBVETCEBqNT/kwqV8yvh50pKrsL4XeyocCmaYRkAzObr
	Gq7wuhDAgW/a8Ss8zaoSoyVk+44duNUyY8+GRtbpoFDXFUSpkY0UtoPkKzi77Dvu
	XCFkhj6vdHA4lWYM0toq32Hv+FY9riEz+LODeH60Xd/7dD/cB7oeBKJkvMEDrqZx
	x/K5ED145SAULBltjUxVfsj0ApyBJ+6RzXj8YBT71VDPzQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12pv9he-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:27:32 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c15deb3794so197696137.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201251; x=1793806051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SgVHroHe26mmsC3+gKDh7oohcL6PcbX2BsXPMljkV+w=;
        b=Wp6/APDXa0RqemUiErRdA90IyeB+vElS3ja/vmjbFHEnKEoFmsOE8qkyeaxfS5P6If
         B85CYKFaeGJPYa82OSUHx3i7shf9/uDTejfq+XkkGCo470XNqZtF7FKmWPyYqWjMDpv+
         F4SOtKrGNgQi8IHps/+LRYunPovg95uygIg2D/TbkK5i6n9bDcz/bTbFP5Fxj10HxpmI
         6oabE3y9AbuYVHcXohvXECm7XkjaL5PsDYtHfWaXoV/NopxCKtZtFQnCwUU6DZS7VEbe
         OTYesey0zVw5UiIMdBTPKnroWMKadG/Fi11mCxsxifhbR17uhgWM19pBm9A3yPEkUI5t
         nYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201251; x=1793806051;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SgVHroHe26mmsC3+gKDh7oohcL6PcbX2BsXPMljkV+w=;
        b=xWoRhT+d3G9VPQaA+Tr1Kuzc6uOf0347ou4aYkLzJe3Dkh7W979e7rYXO6B9avIhZ5
         zpKm508kwgO+TsRxOklQ0v/jAbPlPHECe8v5u0ehp7uCzPxMVc8Ovbvkil0ySPIDfW7E
         kFNseK/8Sqn9sVzIp5l7TYJbnqfS6Qvqn7qoBbaUlZfLZDVLvuoZBhsZ1hZOg/iEZf2R
         W+Vi3s3YXTD3DLkJfASiL5KOB6hIorNDLzS2g4goUek5N+NkfJ39b2c6NzoYtVvDB4Np
         03xuiaLS5lE1kpdROAL/8Z7sXkUm3YOulTU/4c4Ot8PW19nnlqVkt9teTtVP+K1vdc/n
         pJ2g==
X-Forwarded-Encrypted: i=1; AKwUvByCBcLnMkBFCh2n9/JLmRY1q+75MSFKOeciYfr9oy4lhDfGvZdSrHi3jf/75JHJLnEmM2pXsd8VUkZF@vger.kernel.org
X-Gm-Message-State: AFq9FYK9gkUHVOHRTcwVKvhGLbwhyqZMegXU8BGdr7hAD5F3hcFMmokD
	PbxAVhpL5IcrsHQMpL+oC9CfvXF14e3Iw99tPfPAadf4XG+VI0en4V4oICt9PkvedYbAqLDdPqx
	x2JwotOwGcccv2IF7QrY20BdxAzmSB/c5MFvCjPqYSt2WWm1WZyoovUGpesiC/qQC
X-Gm-Gg: AYBFou2nKkMgMSICWP5lNxvt+K1UBgbHvl4SW2H09y2uOGqKk0oHeuqVc7wDT7elcKT
	fRULYMrUKyGWzJ4ofh+Ataq/LmXQEiicwshqlPnvA3WDYo6M5eWI+ryTFkNCmdPNTRjOEzSmMNW
	vVtMAJ9MVE1P7raBWXBUS1ueuCdywPZfzT+Y0yKUvglrWcb8GOFelP73eW2ay0/b8eo7hmWrDvE
	lfz42xq0cj634/+X7DQ6NCLTV7EpF68jiJ8jvwiwYtcCpYu3F9ANQbmjRQQc07JEhOHN8sFsAQ3
	KKAFPhoKFSRsBsxJsyIWNf3+H9EhqZgyNptjC3dvROkgoZEqO63iGTm3zNhEmJGQyGAG4xvaXge
	XJXziBcWdzDlx0so3q7KDFe2JuJfebCnRbX01EsVfO/VOsfNeetIQMEbHgf8KcohBFA==
X-Received: by 2002:a05:6102:14a1:b0:7ce:6288:eb0a with SMTP id ada2fe7eead31-7d03a5a3397mr1252782137.18.1793201251138;
        Wed, 28 Oct 2026 08:27:31 -0700 (PDT)
X-Received: by 2002:a05:6102:14a1:b0:7ce:6288:eb0a with SMTP id ada2fe7eead31-7d03a5a3397mr1252748137.18.1793201250182;
        Wed, 28 Oct 2026 08:27:30 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a969e61f9bsm35094685e9.2.2026.10.28.08.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:27:29 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:27:27 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Subject: Re: [PATCH v23 02/15] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
Message-ID: <o5sj26cm4rwf5w7pxizqln3dvyjfbpgkvfbfqn2isn3bwsxvux@yurxx5ptr7gp>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-2-95f250b18612@oss.qualcomm.com>
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
In-Reply-To: <20261028-kaanapali-camss-v23-2-95f250b18612@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: UOV_Ev0PNkQHFF6b4Th_LKrT1FKmOZQX
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae21464 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GCssnZSmVGVrPJfrQDAA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXxR7FgZoxf+qX
 AixxL0JYduFRAP91cK7T2Qjl2Cr/Yll/ydJGvxM/KiGrFne+uRQmk/ADOsD0a0z5m0qhL1BP1DE
 5PXn64+SVKhWhhg8s/NdlxLffzxDC0YtRU71Ie5FiEILzoYtN+q4ENQEEeRIybj1wyCCOlslA5h
 UP3g/XQ+sZS8CQbHRp0ul9uV4YjotMEUmx1gLGl1C8y0mMW41ZZU6SNykyf30G6RJGksmqFsKai
 Q6b9wb4CQ9w7mJ6ZqQYifkjb9payeqeLLx3lGjY2TK2kIaLuo6irMjtBdEFoBQ4g3o5GNAWFhjb
 a+1+xqSWuebVghxovjjC9wXeQSuQJzeoVZl/9QVdgr41qzlAh1vD5NX76rvBWjFkbWPi17dsRm+
 H9KyXu+izg0nFii3752h3bEBX/gpr/FcGmLrqy/v/L3IgKBM+OaH0LO6Y8vpas5NtGNz7FBTH3J
 tTcO4q6p8sXvgdR/wJA==
X-Proofpoint-GUID: UOV_Ev0PNkQHFF6b4Th_LKrT1FKmOZQX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX/GzHA1lw8M0p
 vyaU2nI2NbrQUjuYZ8DzaHpv8cRcK1RiwCRivAlnxC56/D3rleTKypIuZt8xYpFDVj5Jah2yRxX
 RqH3hckbbOnIIeWD+LMU9Lt1rVdIu5E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 26-10-28 08:20:36, Hangxiang Ma wrote:
> The CSI2 PHY common status registers are not at a fixed offset from the
> common register block across SoCs: x1e80100 uses 0xb0 while other 3PH
> v2.4.0 parts differ.
> 
> Replace the hard-coded 0xb0 in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn() with
> a per-SoC common_status_offset field in struct mipi_csi2phy_device_regs,
> initialising x1e80100 to 0xb0 so behaviour is unchanged. This is a
> no-functional-change preparation for describing other SoC offsets.
> 
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
