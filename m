Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5782547F2F3
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 14:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395212; cv=none; b=WkXHWY47DnooItTlTn5ZelFK3GJP4JU8zubNAWp31GEf2x/t4Sxhb+lmUFv4Pjbx5ZYEEQz99OfqTBiwCcFJtEDkaApV5UQ6he5JVMlF02kMeypxHQYX3rI6cExFhLaQLL2rQyEZ+SyzLTISzaTvM6GAInGUINzkW9VGulc6qOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395212; c=relaxed/simple;
	bh=Ja150srwy3mFRrkC5Saxj8416lNXSM0AjqAqBZ8T0iM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rlT+d8cwazfc9+cn6iqZ8k4kMGMeF3GUGyycTJhtDdSHZCPTF+a2DkQ4GWxJmnOZk0/6ML1MH0BitdzvSEktVkCfoKUKqR3pfDVriQUShJQN2uVecf1YqZFbkcfb7BDTQyfZ7Wc7VKNpLYeJNUOJv2Tg+jicD8VTOUxRMS+my5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lIyhfN9I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PnEI23hr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lIyhfN9I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PnEI23hr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0aj0674538
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 14:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rYzXu3B4dIp7MCCvaiH/6Vgp
	CIXGA5CKASATJDp6n9s=; b=lIyhfN9IMenvjTlpFjdiWkSY8LDTOgpJB4h+0Fqz
	O6um7sqLwO5lmDY+i4jBPIopxm7MrJl+k26OodzhP2K4sIJ4rmcFCuJEaqEN3JHe
	10efQZErtlvnoGbZrrTHXN9D/tY8bPLk2Bjisi/w7xsEAihle8mYkjbIAEyAfEFO
	0Fqs0rhwbtsdiXewMxuk0y41kRgyWMcDmsO5Mj2vvk9L7Pu9Tmp+xwYw1AgAcMEH
	5Ch3/6vTUtVjPILetgLy+U4Ai+XrFVpygpDtEYE2BS+NYeZBs6LYGQZ/npuSNUv6
	jhzek16eOyFIyDBOyayvpUzfx6lHO01eMRL8KmZDS8IEPA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs92yp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 14:13:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so658871485a.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789395209; x=1790000009; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rYzXu3B4dIp7MCCvaiH/6VgpCIXGA5CKASATJDp6n9s=;
        b=PnEI23hrwJRD0kM5xRgstrT5c55pDbvJatGPF89o6UdIM6A06nLOG6qaP5UmLs8ll5
         Vstftb5ZOO0ChocPoxqZyaNpUn9mdxtDoiO8+Mw6IpgCKv6uW++g8HwJjOVPExvV4jQM
         JaSENs0HIGLeIjLITS2rA/KrqC435m4cv7bUtxkQUg9sqA9z80M/YCGG1laOx4dl6Vp2
         2foPOjSoeSH9DAZsSI/35tp3welzB4LL5hZo2DxeHdoaQcxK2jQ+6L6KNrvMt0rz30F7
         jfEcJC+9AmiHcLVBO5xq7ie9mzlQ6x3MqUXVndW+wSnalBvZxJK0CHoAgurs7gll1Dcf
         b+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789395209; x=1790000009;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rYzXu3B4dIp7MCCvaiH/6VgpCIXGA5CKASATJDp6n9s=;
        b=sUa+J84kQITKKH+FcbtM8lAyzq6FUtckvwYSnTauWd+ZOMTTO6zcmYF1cMGXP0e3ZA
         DwbQiH5roWG2oMeblAzbjGsfIfaXt28nQFl2eABSd9jn00oX/up3bn3kAJh/sym7ub0K
         Z4FjJvRUrY/8CbXR8Ww9z13RLrHo0GQtV3OpH0xm7HOckleh5/qjeMERoMoT7hUwuqeg
         62MjnGlRRdgGlX0YsBtQWF/tADQmjK6z6O0LLvL6r4hGCGOtkD6AhyvouEHzp7JYviOR
         DYYtlXZg2WepDDby+uOEJEZp91xTuK+V/C+iKWl9yf7efGsASNV1IwItCNRcI37v/SVA
         GYrw==
X-Forwarded-Encrypted: i=1; AKwUvByOad2UIVE6j04D/jImoU6bLvtpHMxFgKaUSEIY4dGPrkHSL03tKDjnuwtXAoh1vHssSQv8TR+flOb4@vger.kernel.org
X-Gm-Message-State: AFuF++lf64W5ugycIVABiMlLGSbZ/SmrvGI+5jOcRFX0CxcncBumNG7Y
	JUlZ9i1UkDS2amjke6htJ1nID+APypNneirC2r7Lms1ED13lcEgwym5v4mJkc6fkU9EGMr4eon3
	MYwaU2rVx9TPI1nzERzoO7VBn6+JuF6aLT4qUIIR91GGXV0TyhN0ImP9ZmlQe+R7y
X-Gm-Gg: AYBFou3VPxrR4Ow0a42QwSSrvdFYPuZdYnFt40EJbDI1gXYrBFREbKlV5oDbfE7vsex
	VRVIZmq/q6u9KItsTSv/tSnlmALV60XZ7jbQVfntimTBuBCd8o4nfSIDh27prXXAdmpWmr4kROH
	1goaAHfiudeaE+R7Pl8i3AFgj9r9QEdkYhXRcNJvTHJ7RWaTlODYoRgcWk4/dRRXzAw1Ny3bTb6
	A7VYBtUi+eGq/+Jzsc7qZZ6f9mxV9qhWq12jxVpUpc7EFcu4iKuU9u4H/rxN2mZxPpr1rW0TrUE
	qj5h2GKs8k3+5gLnEYNQRZkOBWgfKBVVK0FOv0i1EmVXvs3ltLsVt9z7/7ooYnqbHoY8m+gVcXV
	hhmxDZjcZZaNziyc=
X-Received: by 2002:a05:620a:4544:b0:939:b053:ce44 with SMTP id af79cd13be357-93a1870be85mr691999985a.22.1789395209462;
        Mon, 14 Sep 2026 07:13:29 -0700 (PDT)
X-Received: by 2002:a05:620a:4544:b0:939:b053:ce44 with SMTP id af79cd13be357-93a1870be85mr691991485a.22.1789395208751;
        Mon, 14 Sep 2026 07:13:28 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d23b945sm1815295e9.1.2026.09.14.07.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:13:27 -0700 (PDT)
Date: Mon, 14 Sep 2026 17:13:25 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: avalon.vargas.centeno@est.una.ac.cr
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Val Packett <val@packett.cool>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Fix touchscreen address on Dell
 Inspiron 7441
Message-ID: <fx4mot22jw2wzvd6nhzjejfjip76bpru77uj3ag7v2n6zedk6o@hze6gos4ez7j>
References: <20260914-dell7441-touchscreen-v1-1-d79540ca5e81@est.una.ac.cr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-dell7441-touchscreen-v1-1-d79540ca5e81@est.una.ac.cr>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIwMyBTYWx0ZWRfX6yMxu07ZDmIA
 zviNKKEcsHS2MKMQwIua9DZSvmt7EEK3QevAU1+X1XA9P3rct539tdeR03Ak1nWlrgqnYXadffP
 OfV5d57dSufSBgszujyad68F9yJyf40=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIwMyBTYWx0ZWRfX8BkNV+IZteab
 YIdVdLBO3p5icBSkdcqBj+gN/H60GjCyLOg6FqVbF411EmrFTy4+wXxFMVlZDhxIRYvdXl3KE4W
 D5pYa5zw6uBTx8POy9xmXJPuCyOhvbPB3rrtt5io63JE3a5wqd4sx07oMFFVQ7cPx4QbVhQ4Wsv
 bVEHohbGV9RQs+7NbRHWej36qpnNqt7fqyoyymaUMNEoRvuMAr14psSvu7ZAhIHQ5HDKceMUAox
 EKvlsKxZCxJOdlHjN9iGI9xANFuAbfOVvyfAxER0z7tBRL2HUkSA6++f9c3o9jFsVfy93Atov5A
 G+Sz+vf5yyuj7e+9zNpAaOQPOUP28xRdLYHmqJhOcylCtoz2De39PM7RMMPHGnyo//aWZwkbr+0
 +XM0nzcRqlX8CAWv2w26ObavBjo+CRRfWG5V7jFIlnVYAvUeVgNjBthHIIy3pVDJ7sBaD9Eo2VE
 A3ulKAoEPdpgeg5c9Mw==
X-Proofpoint-GUID: A3n1vEoB7NAIP3o0mDyfFTOY6JEVk-At
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa8010a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=BXSMCdXCMYupIW_o_JgA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: A3n1vEoB7NAIP3o0mDyfFTOY6JEVk-At
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140203

On 26-09-14 07:30:47, Avalon Vargas via B4 Relay wrote:
> From: Avalon Vargas <avalon.vargas.centeno@est.una.ac.cr>
> 
> The LXST2021 touchscreen on the tested Dell Inspiron 14 Plus 7441
> responds at I2C address 0x09, while the device tree specifies 0x10.
> Probing the latter fails with -ENXIO and no touchscreen input device
> is registered.
> 
> Use address 0x09, matching the LXST2021 configuration on the related
> Dell Latitude 7455. With this address, the controller identifies as
> 29BD:1103 and binds to hid-multitouch. 


> Touch input and suspend/resume
> have been verified on the affected Inspiron using Linux 7.2.4 with
> the equivalent device-tree overlay.

Drop this last part, as it is irrelevant in this specific case.
