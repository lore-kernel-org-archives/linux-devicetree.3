Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0102E888A
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 18:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782586509; cv=none; b=YGm2JB4xD/uOFsH8XZfyY3/kpHLYFxJtgx28NDd3DPsmoJeuMYaFZ0KhfQbeo/nfl83WuaYCazzc0jT/Bdvj5OL86QGLhfesM9YarMZCwHBPlPyYnSs3WIm5O/xoyrm93rY6+1n3io+pvv8PJQt9Ojzp14viW+MmccPddFzThM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782586509; c=relaxed/simple;
	bh=4mG5tfq+QXveeJsMO4ah69axRsewsjvHI+vy9gcwdy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hYIep+GTYIfihYlRRYNl8HCg45D2HPZUtwRbRDaLyhUlJXBww3wjryuxHi/TXh8oNv3N2f1sAa0JZt/qKeJyfXHohP2Rr9/+3SKG23WcCx4io7TjvlUyHGOnMZH/xXcdIa3hV2gIka4q1+LL/yQVqd52ZNiuSnU/vqw/svXu1nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hqg/1Jat; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pltpcu6D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hqg/1Jat";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pltpcu6D"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65RHoMqM1719357
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 18:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jatdXnWQM8d
	1TXI4VvR7posPZLHLELS0xraga384j5Q=; b=hqg/1Jat0gbcKhNwfgF9GURw05r
	XLSdnFsozYXVg/GzSPxsZjkbcAsvwontFubTKQ3vRLpg524eNmJVDy001XKiPyap
	h1O0Cj1UWOmDRu4EWY8C2an7+rfKmXzP80iih9BhDxNtc40j8gCX/ax1V3jT4MvB
	IzXPun8KZzb7ki5u3P+qwKTkjqpn2sNzOwWWKgk9WxQmPtDg/VIRD4/0WIZtnYbn
	5WjSHV2FNTba95NIY2henvz7gKjJq+ESDUP/8zZTwjbvXZKuu+TekLynbt4/x2PY
	iaZikZxtzAvc0lX16bTkNuYBAXWYIngz1+BCuYGvfeH9BY49pKjhreA3CMg==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26w6hh2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 18:55:07 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-664b514a8b5so1429142d50.3
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 11:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782586507; x=1783191307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jatdXnWQM8d1TXI4VvR7posPZLHLELS0xraga384j5Q=;
        b=Pltpcu6Dvw4B2jujPTfEmE4nESqIKNGQs5LmMMDmmeEouzN4y6Rjyq35pqUEMhOYGF
         sJxHAFu7l5A0U86bbgjIja2UfYeLHzV2Mnkt114AeRC7C4CULhrtGycOYL+WhvsiD9Ow
         81N4VkCMA7dBl6t+C/1UlAKCN7/bRCuldLbZxPrbHK1IbMoz7iFbaZPoJewjBGSzo+lX
         uk5x1bPFx19bK4X82ERXs6n/yVzp/7eR5JS82oytSWrVsPgOTnZ42TZqbo8RJn5GxaPn
         IbYWbHZh6S3jFdforljPTfibFrfbLboiZJl3X1BpNTKYdVpoPNZJbz1y94p46Q0zSj2w
         k3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782586507; x=1783191307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jatdXnWQM8d1TXI4VvR7posPZLHLELS0xraga384j5Q=;
        b=X3Hgp8aJ0pwWkqRiz2Cc53V2RJiyzAOr3i73B50mIDUiO7ZRUYPZoge+fsfyXOZ26f
         lROl6tugWpHhtyqyErR25W8hZZWtWt5sCvVBNpCLR3oeRInjob8yq9F9t/l/WypXFqX/
         1Ff/G6tQkWI6yG2D0Ab9u8/FRmE/GKJOuw9Eo4VKCLZqUgbUG4gOPZcAgai4iw5YblU8
         j7K9sbyrIu46jRlsuKM2E6BTiyoLcvUH/J3sdaCKoE8KxSrx1vnXu87qos2T9zRD+U8c
         sMLwLLiF5wd1qVXZSV/UEYZfTJt5PP4wbXHEFhmK+qRWRQlSwTCZpatw/go6vh4SziSj
         hTaA==
X-Forwarded-Encrypted: i=1; AHgh+RoEnzlRR60SMaEbhijfs31EdwRUZviv0SH+BbgaxHvpihs56a4e+Uysz68Yeu0D5GiIcQICjhq6avKl@vger.kernel.org
X-Gm-Message-State: AOJu0YwDoj+Ujbx+auycXg1WxrfES9L44GjO9FXtvafeQzit3ACvDWsy
	jJ9vp6oxtDcddW+IxwlNpdEa6IW7Oks6uCR7YVYrIM6mFnyqGYtE1NuhiuaLwSoSPHbXc+JwEuO
	+lAfDxyk85RYbtyem0TjSHDxgkQZaW0994OmJYXdlPaRACGJnK8ANooq6xiaMsT46
X-Gm-Gg: AfdE7clI/eUt0ft8MICqUTyEn3NDXChW0hgkaPWndwxdyPHHMhFfX0XI9z/YPjV6tCd
	egQLC8n4G6kzbaoKMmR17CNvZA4qqCWoDf8Nh5DHgJmk+7G6q8BA3B/xE4xW1WcXIs+lI5Fi3w7
	Fygt9f+pas5Zq0wDFdr8tkv2H31l9VmhrqVu1WkRXW41EBvdiGO2Tqsb1E/A8rTOiLwhdhazhlY
	7i2lHLzLdZZFsdwypfLeMFyZeV4ANBrzxCUKKM7WVNyq1DAJQPLteyIL7WDSPqtODjCb3LQSILU
	hRvQcV3SsDjYSpW20PaYW/BFb2dOkXXNce0iZsz27j8I5SXFU/4jcg30SNs6cv7S1FPvC0J8o95
	7802MQjP03ipODIvnyyK6VbkH2cc+IX8RvqgFdwhheb3N5y8Tc/7md5SHYPvufPGwON3JI+S2Yw
	==
X-Received: by 2002:a05:690e:1c0b:b0:664:ae67:b669 with SMTP id 956f58d0204a3-664ae67c515mr4979642d50.69.1782586506813;
        Sat, 27 Jun 2026 11:55:06 -0700 (PDT)
X-Received: by 2002:a05:690e:1c0b:b0:664:ae67:b669 with SMTP id 956f58d0204a3-664ae67c515mr4979619d50.69.1782586506389;
        Sat, 27 Jun 2026 11:55:06 -0700 (PDT)
Received: from localhost.localdomain (108-89-202-162.lightspeed.sndgca.sbcglobal.net. [108.89.202.162])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6647f785f6bsm4759538d50.6.2026.06.27.11.55.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 27 Jun 2026 11:55:05 -0700 (PDT)
From: t <jason.pettit@oss.qualcomm.com>
X-Google-Original-From: t <t@t.t>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
Date: Sat, 27 Jun 2026 11:55:02 -0700
Message-ID: <20260627185502.26948-1-t@t.t>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <c6966f05-b1bb-4b71-8373-c90995ab4cc3@oss.qualcomm.com>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com> <20260625-glymur-send-v2-2-00905324ffbf@oss.qualcomm.com> <c6966f05-b1bb-4b71-8373-c90995ab4cc3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tji4Iml8eJT0bk-ONvLZBd0XBJVEdmI8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI3MDE2NiBTYWx0ZWRfX+8xLewrIjmgS
 KFoqkaPgiW7GyOFvv39f7tkNHbrAKYWIDHDuxqZsweFkA3u035Os7bNVgCuhjd4C2WEjU4RQooX
 QVeVANgio/0Y0Wmik67C1YsQLMk/4gw=
X-Proofpoint-GUID: tji4Iml8eJT0bk-ONvLZBd0XBJVEdmI8
X-Authority-Analysis: v=2.4 cv=SuugLvO0 c=1 sm=1 tr=0 ts=6a401c8b cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=AgdIAmbgiPN5lz+IpyuXaA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ClHHCGylXNJOVoNdELgA:9 a=O8hF6Hzn-FEA:10 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI3MDE2NiBTYWx0ZWRfX0jcCAVGi4wXR
 j+NxtKpTEtL3pm/rIZJHz29pHRhsnflV1ztr0+/Nqd9vhOLJJb5GGpRZzg8KurGo8NOrIklJqMf
 pffSsaoXYFQlLBIDUGlO+4t7Kpi+GP1uUwjiLiYVYyOLV78Weu7+AWppvxO+1IDFU8hgDEEdO3X
 ATtuefoTN522SO95c1jNU1J3Jw3L+fQXneiV37kQy9ingrdA06NJNIvr/44yBTVHyCGaZj1bw+b
 /Qi/p/fsGNEAUdGnEDfgbDNEE/l4govnHMA5vg2qHCo+Z59pcxxsq1Jj4Cx1zEl1d0fodTe3tkk
 1wReou11C6PY/xyd7Q0T7DTcrm9RGp7adKa+4nXtJngf92fu2wN9sNJBkLKK5zxtIpMOwH6+K24
 QqBLY9FmgYS1pwxiEpaBzHF4BRi+hntjO5GztXiRQ+tw4CGMjsc/qwBd6YLoTVREprwZ2/oM+Kc
 QSZ5+KwMnwbVBRJuFdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-27_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606270166

From: Jason Pettit <jason.pettit@oss.qualcomm.com>

On Fri, 26 Jun 2026 13:27:42 +0200, Konrad Dybcio wrote:
> If you remove these two nodes, the QMPPHY-as-DP-only should still
> function (it's the USB3 block that depends on the QMPPHY, not the
> other way around)

I boot-tested this. With &usb_2 and &usb_2_hsphy removed, dmesg still
shows the af64000 DP controller binding and /sys/class/drm shows the
HDMI-A-1 connector as connected, but nothing is displayed on the attached
monitor. With both nodes present, the monitor shows an image.

So removing them stops HDMI from working on this board.
The comment in v3 will be updated to read:

	/* usb_2's combo PHY drives the HDMI bridge over DP; keep the dwc3 enabled. */

Thanks,
Jason
