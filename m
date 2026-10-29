Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269405;
	b=Sge2pIC8OFA+HWWdPvsYUgrwa7qV5deCdlh/D62Avxaj6xA4ffIhaJ+6R+qXGAzAHs4D
	 Xb2cDyBSXXZuRUfypmkURbLR6otY9etOuh51lkodv6c9wKizibnJCfso/E2aDOu4nomCu
	 R0dV+yY1P/gP/Z96eCIdsGBRHLaVCut5edYX8jHEZLKJ8X4b59bKgp3M9JP3MuRn0086l
	 ODOFZn91dsS16SWvSZgyObG2IfB6Jmusk0Ng6TyCcYJNmnYiKRpj8RS1KwDcDrm7Q3M72
	 r7S+At/hLRsWSG2SW4WfaiDlDXe++RCXA7UUU9UTI11/S+1g5SvH5FhaDjqM3hJuy3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269405;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ha3fj/COMHQz5CNWaubKxJEoCG8ElfvHahMKU0w0GYA=;
	b=e/AoglAQWOzVgauyyL9iA/MEU4FdZeBBVBDSV3pCbLwuc543BGmy7Jdbrz/I9Dtb9NDB
	 Jt0e/WVN+Xo92kgjDiO1CNpiQiFKYyBo5P5lOHPxwJOdURegSef9FuCtQQbaXomboC8g5
	 8WkLWWYtHH1k8VnSfumxHGk6OAt5dycmd2YID/2djNde392T3MCIteg9KZZdfXSEU9uBs
	 xjgbMY/7enJi5poCdMm456LhU6gfdGBNLYF3nb3iBYt0xEQm4Hu9PC+4i4DB8ZyUlf4T1
	 coJ89wukqaIfavEffjruyChdtTeEha2CUCPueCRkrcFecYsAgVOV6pONuCvPjk4uw4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zm32Ublw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YGMZJ8OU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1507606A31E
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 10:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1507606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zm32Ublw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YGMZJ8OU
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vEA93765947
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 10:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ha3fj/COMHQz5CNWaubKxJEo
	CG8ElfvHahMKU0w0GYA=; b=Zm32UblwrpFNdJzdB69DOZIKQdTau7hMM+lmAp8N
	cJqczZeK3MXWDjsMs/sjcArdqDErxtMVpFRxP+RvIb8k/EwuKejzg1JVOM66N0nj
	cbnGQqPEh6cTy3RutZq3HJdxyd+Z6MyB0+C5FirG89nUuSym1y8msLtvUFlKnr27
	kaVSncyxq4GMcY6K+Qyw4PXer81E7AMnLo5sMM2e4XYzGAbKm1TlYqCJbUr0v6MJ
	pIK48p5sEVR+Q67V2+qmy2uEC0m+JQwe9lHbm7E5AnReEJugdazjtXaUgkLyYtpE
	9E1oZWtf/KqWF6O30IIaDZyh4q0snx72PcIhxhE4IUbvzw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpgpu4c9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 10:23:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9441113670dso186243385a.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 03:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793269403; x=1793874203; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ha3fj/COMHQz5CNWaubKxJEoCG8ElfvHahMKU0w0GYA=;
        b=YGMZJ8OUFPxKCWqSPM0Oyxm9UjjArWy63XAPVkrOzX4bSG8GiVGSbw7ebueswqP0xG
         yHVUv4zlCrVaPZ7ke/uTcBzS6/5g3ww3Z4vbx4u4cdrV7dE2/fdDd3l6ZlT3l14gkfZi
         IZqAuo9Vmao1eN2zdiFJlO49qjV3G8szocpTzRqrmlhgZGvGhmpJ6yrABHLQbYWQpFPw
         BtHUV5GvWXhYe1JEvzH+obREWd9X9UD8b+D2VLK9PF3pIzieVDipY8DeCglLRWGVKOig
         tlBS851tPk4E76f9TyXbYNkOqtxGePGqmVqpPPq2uisBUM62F37ePQKQ9ueA8AA/IxRi
         lQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269403; x=1793874203;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ha3fj/COMHQz5CNWaubKxJEoCG8ElfvHahMKU0w0GYA=;
        b=q3wZUcvLExHKhJYYUcwKuy7WexLF3oKHw2OsxYVrT4MgOufaTWVI1v2qaeFZZM5Ja8
         aGEb9fQi/dvcpXfNFKhNHagNa6OPIp+Cjs2m7hAbWe2fHtcY0voGGlSuOOWe0qgUwumf
         NxaNCARurHAeWNoW+BGvbJ1c0GmVc6mGnZWx5m4a0ClIuRh7fiGhAJpB9usr5SYCcBvM
         HeDzTCSNsWa94yQpC/fp8Z9jmun5vtkC7coVZMsGx6cQ6iEHc3n57X6wwQ03YbnkZoUW
         tsb80BjPt2heqqaP6XlYeeb86pBFcJjDIKh5JwsjhOHO3cX2vUaD5NTWtjhn/gNOm4Uz
         xHWw==
X-Forwarded-Encrypted: i=1; AKwUvBwMHBHWECOMF0VG/YQCTzoRC37R2UaCwpSVS46ITo/pENVqOj0I3BBOW9cdL3FspmrHwc3Smw10N1gG@vger.kernel.org
X-Gm-Message-State: AFq9FYL1I3DExreoZgzUqxhI/5YEPf6L2x4VBLUYwR1OJauvkmLtuZsh
	FaISD+UeA0ylRU+KuN0uJ/QNNKwHa1vQujOar5vECliPTQA8MAybk8YvebXhw8tJMeD4OLtw/Jn
	E57l7JBi8Pm0WmQu4kZ8T9k1OVHf/spasEPF/8zkEGM2wo11FeqR27GCMbDeyAkCf
X-Gm-Gg: AYBFou0f7ycFAP5T3BM5MRfEhH9qxn4n1sBvrqC+rDLGI2Rpz3G29RUDIZUYJ/FS1ss
	/x4mYuS5lqqsjR0lXpli9ONsdE3LKC98o1qyAaqBApzoZI47MHaFzN2BVjVCSNgpyDAzkl6khU3
	8N7hvCRWDpG/qQjiL8ibIizq0x7UdZbVYh2a6ulj8zKOAVUJUZz66DZ3g0OzwluiKu3cBx6e140
	WZK3r+OaMMv5dumbxs7OAqSdbOsL/c10hhEkJD4AT4vSOhX5yn+KS5UueRMF9xlsTprjs8LJsoD
	q/uYvkiObXiQGA/y5ZkBxI0Qs7xLJKu6JvyP0QPl5bBkOBOzlNPxJJjIfzj2B+tfpAaAGvQrKqr
	Psq5gHnWfz/QJQzFbjou40MTuHPWayqUl3OPejrZ+4CmRqukSYODdzLCNmmsiEjWY
X-Received: by 2002:a05:620a:2616:b0:93f:23ef:d6ad with SMTP id af79cd13be357-94408899f84mr736629785a.0.1793269402893;
        Thu, 29 Oct 2026 03:23:22 -0700 (PDT)
X-Received: by 2002:a05:620a:2616:b0:93f:23ef:d6ad with SMTP id af79cd13be357-94408899f84mr736624485a.0.1793269402246;
        Thu, 29 Oct 2026 03:23:22 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfb8esm33494130f8f.54.2026.10.29.03.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:23:21 -0700 (PDT)
Date: Thu, 29 Oct 2026 12:23:18 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v27 07/10] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
Message-ID: <sh3b7m43aw5wtrolooxsib3rus6br4rao6wtnc267rczqysyis@75voym3v7emf>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
 <20261029-arm-psci-system_reset2-vendor-reboots-v27-7-fa4b3ff1359b@oss.qualcomm.com>
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
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-7-fa4b3ff1359b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfX+15xFUuO1b6N
 r8cbFlz5H6rINvFZfKthPThtzHlJ3Ab1JzNMllYwAzUdpjS3gvNimT+Yt9FHGfxd77ctMHjB0EJ
 jcdP0WN5qk64LcqB//Kg1gyo8cLKIkOkUbHXLJQxU+PUWXjSqUI491+tQXbc1c2w/Ps2+AQ5VtF
 OlHIenSUpzJF+T1SzYZfvh8KNFU20o35mq3K0RMD8jhrad7xQbkAqIGuotqE6/OVbdVVG05VpSt
 ggFnYSRiy3O62UKkSwiJvPQJ9j9n+KHelvRmwZVFF8LMvPBFmn4m33f9H4u/BGzSHYqeZxTtNds
 iq0ledCrk/ILr2MI3mDRKuzupDGIwWpd3lX+aMe9SFSkI9jy3iQzJluNZLMiRbpXgrqoXtaleJo
 Pik0QOuaeHBOod9lB8oGRiwx1PCZUwWgrgh5lxrq3qfxTl0C/ZrFxAM3IKnqUEiy0LnvFiBiDuQ
 brGuSF9PTtCWtJ47nfQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfX+ZqW6Yr5GX3C
 yPWHBUP77Ad3szehzzuxiHLk9zMCzjAeFDE5JsamFbJiOMd/Hn19YVmikYUPQDTVI+8UipxbQjR
 dmE4C1l2eySnhVXpnGdI+/0TRkZogmw=
X-Proofpoint-ORIG-GUID: 5Au-_V-1sQc6umSdjDrjVY7z_kfLZZtC
X-Proofpoint-GUID: 5Au-_V-1sQc6umSdjDrjVY7z_kfLZZtC
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6ae31e9b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=XpayGGiaTZdiRO3YngYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290040

On 26-10-29 14:31:01, Shivendra Pratap wrote:
> Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
> for use by the psci-reboot-mode driver.
> The following modes are defined:
> - bootloader: reboot into fastboot mode for fastboot flashing.
> - edl: reboot into emergency download mode for image loading via
>   the Firehose protocol.
> 
> Support for these modes is firmware dependent and not available across
> all kodiak based boards.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
