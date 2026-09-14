Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0F835C68D
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371511; cv=none; b=hSNZaiBVsHt5gyfo76k6LCvc0yV+EV3IgquWg9dtTRXfccjvHHzRiJA3lP2UWjXGfWzaeaq04qlPzfoFuzy20H3aEc9Wbk1YFsfNbnB4PBqjq7Kszvm8Ye9DWYboTjib8cobrWYervE9rfr+E0P3bjZvVHkXnHRwaLsjkh0tt64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371511; c=relaxed/simple;
	bh=eg1exeIQOUuF/0XlpVPIdG70UibnUsfpjsShexP9O3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jreNJ6qqqhLEFj9ytsSqlogTeT4MqgVhcLHqzBvH4l7Q9As1aAPKXGRtv+Kyvi/2B9aeSziK5Zlj0RvtRDaZaIidjS2CJ7RibgD7mJqNfA9O3q0+xe+Du9eD4cVQJZzvk7BDgKq6f415uxdrA4q89QyvfHfZdo287Ylgu7ta0sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PFfdjWgR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GX7gSBmA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PFfdjWgR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GX7gSBmA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5igXo3901030
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N3Yny/OsUDy5NzfmpLLzerMK
	Pz5FLRY9LmfMQ5omQeI=; b=PFfdjWgRmIQEBnegwwMgVfrA5q3T7DFEZRkYSmto
	obMUpmUDfAd+tVQba6NOnetiPlCNZXL29U89dxILKerikl4d96jBbJTADvX3Ebfz
	ScDYTcuRNNyur0yi8Cv5CYOHQr5K1rnL+w3YbGtRpVAKgss2F1v04152fsknD6IB
	Gh/B1zmLWdcRKRXjn6k4qxOaTZf1PgAc0v8XvWe5x1DAmy/54Al3u8elR/E2cgEQ
	SSbYEVAlIIquEE+UnP58+vZRFwhZ86+GP2qABpzUC7urOGAaBdfyynz3BMx91JWZ
	2irUNn9f1AQjgvS3Yc9TA5e24SgOENKgLblNseqzd7Deow==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d5hfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:38:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939a6937513so463047785a.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371509; x=1789976309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N3Yny/OsUDy5NzfmpLLzerMKPz5FLRY9LmfMQ5omQeI=;
        b=GX7gSBmAqjWTAPNAsAvZT83tcQlaSZI997m9a9aNNG6FvA4WjQj5VT0bvW0GdGwp+b
         cFxxjnqsSl9JrgQDnZSvu6w6O7HL8sgaV98j0GSfzQdAjlTDfgGl3CLwprpMEN66ypoJ
         vYKf4+wyvCWINEic2mCsnrQMEd2JZkcwQfUo1Zje+L18Ziwbi3G4s3QE2gtrK3r6BDBl
         OVe/DD3fR7JPE0HIKGxBAYDdEJxui3DrPEeptDULozJAeLabD/aQqI24NZ1uTc8s38tf
         rDNavRLIBKLQwHPFDPXirGwXJQjuxpEjmbV4BxapqBM3wNB7NED6F4O9hvtRCIrrFQmo
         00Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371509; x=1789976309;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N3Yny/OsUDy5NzfmpLLzerMKPz5FLRY9LmfMQ5omQeI=;
        b=M0Cm92NHoOp1yfxKavgO4mfeJhb0tVw+JzoZp3WTPLuaqKhHgt2ovxHHqELKFdeWHH
         MH45UNTFLiAHHYQxUkdQM+yp8fsQ6H7+BUDeBLr4XRPiN51HRdFeBJux9Jc8a7WJfjqv
         rHD4GOI1ZHn5FXbtYGp5wc7DZUy0oruvlhcZVpmS7Ip0Aam81aHzC9MXg1TDhr8r4KSI
         qKVci8RSGBgNgs5QwCANhs+/Y14YziX59a1Uli65BHW6EuvVJv+3J9ex9bJdt+kenvf8
         pvMLn7gwmmERf0mnUotHCoVRsNBbnLphV3nIhskcDfDqGs6GmXu/LYj05m91sddRUbtJ
         N36Q==
X-Forwarded-Encrypted: i=1; AKwUvBx4KZtheJ5GUksr1jVwKmwRl/XwcDZqk2+rV/mpVAnH2m2eerH/mn3A0v3Du/2oBSCi1EKziY3JRJ5j@vger.kernel.org
X-Gm-Message-State: AFuF++nZQa5FSvOAIulyQto93zNSz0SGqF3SkJv4Gx9xNDVr1BahJ16A
	64Hd2au2BPelITxWz7OKfZ523TquVI6OAMV0KEITyFVJD72HRzLSpNbPKQR0cpFAY6uRF9XNEhn
	nGxvjcYP+1zz84ZwEhOWF5Br1Awm/DCn9XEWTZMIr1u2BI+NEQlqK2aN4j3TFtkgl
X-Gm-Gg: AYBFou2qCP6sL7TfTFhi3fXYci1wDe5Dmy+qEmSpSYaF7lJXEnseKXLVtOj/bxItsv6
	YeVnroBsU0GtuXSixDCZWtx2uZ+EIxVU+4oO7q9kg05hLfYx/oKwyPudHhGOTUySz9noHDJ13QP
	5a1SMe+5ceZ+0Xl7SOhQrDYDMDfBbe9jkRCwW6fsbQccNbvwUtC70S/0QNrQ2ukbpLiBgDae/EN
	PAFla4+0zv4WjELQ8PqV1jIHYrNVnRL99y36fp5sJPAdRWArehy7SyGd3Wyb6rwl5UPWGRfK34O
	eZjKIYDN7SVbHxw5V2Rc12ejPX0wFUt6brdET2HhpnFUk3XpXX/y0VbJyeGDiokr5vdnvSmgZ18
	ynfDeglnzEDoJ/A==
X-Received: by 2002:a05:620a:4889:b0:934:ab73:ac53 with SMTP id af79cd13be357-93a294bf61cmr210799685a.0.1789371504018;
        Mon, 14 Sep 2026 00:38:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4889:b0:934:ab73:ac53 with SMTP id af79cd13be357-93a294bf61cmr210767385a.0.1789371498818;
        Mon, 14 Sep 2026 00:38:18 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee5csm24899801f8f.20.2026.09.14.00.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:38:17 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:38:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 10/31] arm64: dts: qcom: sm6350: Add domain idle state
 names
Message-ID: <pkyhw2dwwbzlp3v2kr2h72jlixzlouappyal6kahrrgezs2dol@o6ku3lbgbtev>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-10-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-10-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX0JP3MDdN87DW
 gmZSBApzQWhf7VQkTityC88XwgwdR51Ng9ld/JDPm70CdG4LR6eKK3iJcKVii0rod+6VBaMOVBO
 nl+WIqTiOSVrzXCE9+Y48nWHPRdSmTM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX/tx2lwcn+nLz
 mKRlVl22XliEB5up9IYpOuE/sIFbF4M+/hobeFM5DtpYML4pvzgs3egSnXoUbqNgZcQfuMJwXoa
 SQhY8j1NKJSXgVLZA444cAFNhkUKIaIBH8pgqulPQAlHcIpCVa2WOqFxe5UISLO2KKXOwfYjBtl
 eg0YmaeZzHKwOdwDrlg9VksUhdj3qJXc/goXulRto0FMdFEOiC2La9bNejFbDDowsrpFCWFho9f
 V7P/GUP9f706KDjnk2SpokB2M2xBVtJY4erV0URdfjOpLCEml5au9zvmY+dfJQjyZY7ih8Z5nvh
 zdexrQcQYz6dL3+yYC7BQNwdHq9Xgds8d3GSEfQgtx08E0aY2d5J8VtfzQdZkINVPK5q8+6euGh
 4KZeB1oPEDLYFtlu3pU1UQKNqzfVemJFUPdaRBh49JOo5W5kRCXwJZJXarW+qC7021xuKXvkZLq
 hIRjkcpzWhWuJSST7xg==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa7a475 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: vxTLIXEW6aOzmkBZ_WqVnyqoX7lP38ye
X-Proofpoint-GUID: vxTLIXEW6aOzmkBZ_WqVnyqoX7lP38ye
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140106

On 26-09-14 12:29:42, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
