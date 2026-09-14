Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299F33E49DE
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371683; cv=none; b=gYB67OpZoktpRhaR3hblbORVONfoa9NNYpOxjie5G5btE9y9Qfkl2elCCjdO/d9+YtllPYh8Xp06EXRcuWsWMSJ6A+FHRKRsOScDGjd3M6MZvCJEddOsuqtrWjTfLReKhuDk0XzL+CoJWyWhp+U7QCAuwf+5A4asMfdscF/oii4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371683; c=relaxed/simple;
	bh=S9mfOgZNT37L0iqPCwnRCuYwvCwRk1c/oJFJz7QOEUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nhQyt09aqMqO7e47JgWMZjbCMCgb1MpH9ERwmXXlV/QwwIfpsJcTqLyiQpwewdi3npIWecrU9Trk2WcAfD46MkorlzdPCHnML89UMUrG3/I0TyLvDymJUWgFsg5pgDF/ebhNEy0oV7QjKJCKSTTzjsGBuwpmpgXobqoEp6ZMkBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EgGDswqZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cRPTB1rF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EgGDswqZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cRPTB1rF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ivYI3739607
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P0lROkR063X41Wk2R6NFEfyL
	4RNeusxNUrV+Xwt9Mdg=; b=EgGDswqZ01SYxWNR+unnXQnYUUxw1HoMQy1J1hdT
	gGQc6chsMB7BhEOiZdqazN/B5lirvHoe7nEd3LEMF9F7o9lmMsHt2mcaDH7zZLyQ
	7bVr85TynDmEef8xY1Nl420++rYG/hrrpmg3oNSiZGZBv248QNhQYEHwxDqJW37m
	mQetrFUyGozl83pN2LppyefvslKcofAJBqVu7P7CgnUs7AAaZgKFqc9RQidDRv1o
	p1YAWNi3FjsssgKNcOBNjQd/SKenoGwUS9M+fGhxicxIsaZqG1MubCYLr1+APu6w
	Vq0OnhAih9BnTwfhsKOP31heO7GVc0K6SzXtySAT4VcwLw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ddjqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:41:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f27c80a3so589374085a.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371680; x=1789976480; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P0lROkR063X41Wk2R6NFEfyL4RNeusxNUrV+Xwt9Mdg=;
        b=cRPTB1rFbX5o8IObxJneChtp9BJvCLNWptb8S9rqCP9ptdtWea1oYpuTVmISWd1PoD
         R9NjlHKd36QK4LfbVemzlvt5BhwxPUZrVSyuLAhpIWk/KMj1CEnns//4Zd+FYyCp+hw1
         GE4ncFI/y5Qufkex+pWCcFrnwzxP5aJILfWTD/YYLuUwgH3dhvBUFccTrmrGSn144lMw
         9GvRJCuIlPaGOTap7oNsxXXwzDLH5qWt84Xe+RkxsGt6lsclNoig1HzhUY0QBifSFGIc
         MmxI8p4lW7hzSM6bMvGZ0DZKCwSK5DrdchVT5v0w5GZw6guVM5SpscfGBViO2RybwZ52
         bDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371680; x=1789976480;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P0lROkR063X41Wk2R6NFEfyL4RNeusxNUrV+Xwt9Mdg=;
        b=beZ0z9kyYxP9iMeu8/0uXXxtNR01n8td+YAX2U9A8vw1ug1N1mkIeirXGuyMnjBj6c
         S0YYDkFHOHkb+DydBJW8Qk6Mav+rVnBYilxc32Y0GyLMQJVr7sVY6Bmrn14Zt6JwHRbF
         koHZWGiF/1szDIryy1QWV8OLQz8BDgi+xoUt+m7CxCnwL2TRZpb9Jvta7emytUIagg9b
         LUyZ23SSEV7Gkf7NuE9GlI1yRPpzGFn+ps6am/dXPz1FktL6RgdCeWVBUdC8i8NiOmhV
         XznuYeaMN/NWoBBfBMlRERbRHnwpRHGLgSBmaWtinHsB4MU9cc+QreQj8CmcR/C88mWd
         AvEA==
X-Forwarded-Encrypted: i=1; AKwUvBwUTip8Ij7vts2/B6/AeswUOTu3QukfXDzdVYSCJJX1vo+WOboNZtkpdO34A7h6k4f3pm87H7owqG33@vger.kernel.org
X-Gm-Message-State: AFuF++myFt+9hCYI+ATeSKAsvhOcdFZNwgTtx84f+aT0mMke+hhXdkrm
	2Veq44d7LS0eDt+/RIoVvjVrWo89cWLXDYNHI5fnhK5vwmHTRGHu93PuW10VkkQueSbN7Q7BOBd
	ZNwuJ09mZXYaVlj6n+FbRQDiCKizlkGp8M3YMgardy396pdd1zPd0zvDQDlqYyVQY
X-Gm-Gg: AYBFou3FQ6BTx/LtbyupBiOkQiKIVQ86bIEhN8v1FBYwHg5bmqY87dE+hXtfrc4S+TN
	Fp7cRul8BG5Ctv9KTl9JoQvciguvIMsgFcNUY6MbtD/ei7lZZeqUnLH5/6ZiocxcYDiwl7QNYoZ
	6IQptuyEHUZ3QqlXB/IEQ0RlKDHNOnOObqyxy9yHiXFNfTsQn2U8LxyGQ+zm8jTIMpYGZSt2yam
	7xD7XOByz7xr0eZoQTA7+Fo4yrMNeABmTKN4Ov/3ota19eeAqE3VfLj2KGNHt0vMioUrxy87oPR
	8gB+7uXhcJ7kAHgrpthE8kGwQvdB8b+I8xseC1u2lYcN1bPiKtUzJveBE2R288m5qGqOAJ6d2cq
	qISbM//AM5GSrFw==
X-Received: by 2002:a05:620a:44d3:b0:939:6516:7128 with SMTP id af79cd13be357-93a2973a233mr211338585a.3.1789371680334;
        Mon, 14 Sep 2026 00:41:20 -0700 (PDT)
X-Received: by 2002:a05:620a:44d3:b0:939:6516:7128 with SMTP id af79cd13be357-93a2973a233mr211312185a.3.1789371675134;
        Mon, 14 Sep 2026 00:41:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee5csm24916609f8f.20.2026.09.14.00.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:41:14 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:41:12 +0300
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
Subject: Re: [PATCH 20/31] arm64: dts: qcom: agatti: Add domain idle state
 names
Message-ID: <n2ddnwkp7lm7m4b2qdcspuqhvqwyriyxxin4onbsjxiklb6jwf@udvna5roegef>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-20-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-20-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfXyLRS2lRM62O7
 moQgzMJIQVVoNZUg+Khi60vr0lHXC8NSqbhJdV4G1CzDF4832e/i3KiHxvfGzwIJnJxDJ4XdZ3g
 /Yxt1oC18G1JTJj3QG+90nghOlqXUXfL09jR/qzE0+K60yavG4DEk4/sjsiE1sZ4ZHcfbApxWDd
 eDhEND5Rgwww0FJzqHn1CUAex85joPF01ecXUN2tiBuaRQIbDWuiPleUkRhWkjjKblYJwvIETLi
 Vi0jLeKmb+FKerj0BWa574suBuCINoXpQRukwyjiv7eHaX7lHvLwdupjGRWKSKiRmLhqrXKPqih
 dwL84gIutWv8F+jY11U2uZY9WiK1KoZNFVByQ8XYfyTfxuptZa7yNEzWyoNE6ejleQtehSqQKv+
 CXzpkHg4pyOwDNPPhz6h2Aje3w1ygbeDeiLbv9EZdgiBVr4aLkNn7axDsWkj2xBY6+ZxQGM0toA
 hg9fwJ/6cAG82d+vD6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX6NTvkEArFQ0V
 0YZp4JC3vwu87m8tokAk1vPN9GmWt1pOaNrypf8NKY1tit0OSOESttbwITmFMZW7R7Lci1afTjm
 iOMOULFNtaPijWLbGTsXrXsLE+z3Z0E=
X-Proofpoint-GUID: tC2zKtdaO-9FWFziSzZBJf5gWY2Wap_K
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7a520 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: tC2zKtdaO-9FWFziSzZBJf5gWY2Wap_K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140108

On 26-09-14 12:29:52, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
