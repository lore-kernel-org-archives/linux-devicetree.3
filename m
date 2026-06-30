Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4719419314
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782828974; cv=none; b=g6112zH+Vu7fgkaBbvxxQ7vq+59GdULibQQJptGeehiVrs4WzYryq8aiQ8YdWfzvrIDhbly+6+YRhLWlrL+BK875s/fcXBwy2B4fYm+1hpE6LyEQFD5muz1F0SE9+2EBzGHLbKAAeTyVz02b94pmL9LYh2iLIGT36Yk8EvsjJwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782828974; c=relaxed/simple;
	bh=PP+eO0GGVrkcXxcUDViMSrIOmtbm8bbCSnGTZe+XxBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RN8l6g+NCgYZ2WraIb5ERatvmSlvU6MTFQsG1C1yE+fLNgjSDBW2FiiGcQTcOIyV5/s7XykNXaKIrSgKEHEJ62YoUU2iT0uNON3qeHesdWXgdxWfL4CCPtNxwI9sL1QZqI5wKkXKzwZZU8ODURY1zywQNtbq4RCtuHxk7XesP/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I0UQOzQr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EkyvSnRQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I0UQOzQr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EkyvSnRQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDHGR2209672
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tuTeDkPIjXpd0ifTlSAJDdqraFMrGLJdsMfuXYMtvhM=; b=I0UQOzQrj/5+tiUR
	IXqiuGbzL1tq5aXjesymfjoRrRtSocVxHeRXyRgIHaBgR9he59OC5IgR1ROId2UC
	saxIrwqQVwfF9lubVPosAxgHFclWWYa0pioApX2+wUgraDQW7E3c8J6pbjXbb1vp
	OkcNzg28sR7hOeQFDvIcgRVcMZsSQI8AR8DvT65llTVkAM0VZxh9P9f8U0KLzLgg
	baruQP+dlhAw/zjhUdTueBtlxxXfDpLDTxXC4S5jYPT7c+Hre7rdBcqToq6fOE3l
	S+azbq4DEEdyFdHNJ2Kqq6GhsuurE58b2PVlhCtR9ft9JjpwAXg7cnJqF6IR/hx7
	SIi0mA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4avpsauw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:16:11 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-737f1f1e0e5so1428338137.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782828971; x=1783433771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tuTeDkPIjXpd0ifTlSAJDdqraFMrGLJdsMfuXYMtvhM=;
        b=EkyvSnRQYevkzZWEmJLzuoIDfNzxW1jQVwO9fg8b3GlzhrGmt+cxw5kSKJK/lRGJK1
         ItHEAEpSvvNu49GYazTUlwwlUyZueaXmNHnnzfdyG5spsnpmP86eeLLLnG7S/LeCnSJB
         GpJQyidZr0zI0yOtaGOYzEcR+Vy3vb60mKZKS1U3IYmYt7zKO3uN5QwbhjoapO1D1UI9
         Tg7zgjjcwZ7sjYr/PU6w9/n8x3WaC/zoMLonUrWW+akasSs43ueMDUdVhkf9eIpihyqQ
         gpQb1NuYTtzqdtkMPszceYbjBpoKzljXQL/7BjrFXxVV5XCMCZg+fZ+rNhvg4BUHMr1C
         8Wzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782828971; x=1783433771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tuTeDkPIjXpd0ifTlSAJDdqraFMrGLJdsMfuXYMtvhM=;
        b=pcluYjlj/yW9U/vTu/1SamiPYX5IeiIrL8b00NkPmbwwJWs2mYL44IxIunlkDh/mzq
         Ueor51AaR+STuFHiPRkoW9blerzPl0I+is6iTVqETV4Skrn0BhMQI1WPoab42+zSE1YH
         9TVDdCCJIXepTTzhiCV/TFoTd/BUhlealQiR7yHfH+0FT8XsM2Be7a4WpyXnIHMgJyPW
         Cau2puJpXwrTu8E6WZwfNgGaUTu9MFd0LVshL2Yrqj5tfNxKWy8NTNA7LnPTXR7NT8cb
         YzAmZZ7qf8W5kheoLD1EpmwFVTkBR/azO+xklKrN1SgxByl6zcCLkuLp8EfYCdZvyBQc
         +4bg==
X-Forwarded-Encrypted: i=1; AHgh+RoGc9/bLt7jPiZh0orVquhRAH0712LOrLR8iLf7IJ2Mp1eo7WUMqAyajGIPguPSoI/i9Mxk70i7QqG+@vger.kernel.org
X-Gm-Message-State: AOJu0YxItZBaZbSRphoK3jYriyquUC8MLlVa9olWCV2Ox7v3Yt+c1n1w
	4lvjOTNOeRy0t/pukR/nSBVg+KBW/pnaOUKgIP65ZRjlft9bKUJ4PyFYPMjZw3Ah2oAdJj6WY5N
	js3+rO6ao1JBRiI/Z8X11fEialFa4BcdpypY2Uh3Y0nagE2sqPiso4EkRE/5WXDb4
X-Gm-Gg: AfdE7cl8pn3ihdWVoRJQQ6EZaLZ/+6jD35NLwE+SxfK4xubt40PQGpFPD/QrBl208FH
	WmKTNbmMY8qaQRECoM+NLlxt6o/XdJzl6jNUx5NfJsgsQDIHbQH7bV+MD6sIDTv8K5XdvdEAxqc
	elYOHStbD/ILuuSBH1I3lglpAOG9x6xqnTsIrjrelKjK1M5iJeNjF61xo5n4u/YhWsdZ63cgpVv
	iNKCps2ooYryGdMRNCGWrQ9xFQKC8PcbCgmTT9IqsXlof1KWmzrQc6D/B+GTDgnrvKeft38znbf
	ffl22q4WI+d6R5JwasyijeEqaf27ARAYBA3ia6N6Uu/YP3kuqgd2SfR8mWLKuBn5Mcz1ZOgry38
	bS0i4hvcrYGiPCoGJn256mvm0JoFFKNOVLfgkihg=
X-Received: by 2002:a05:6102:808e:b0:737:4cac:52f1 with SMTP id ada2fe7eead31-73cb88bfc85mr324371137.1.1782828970593;
        Tue, 30 Jun 2026 07:16:10 -0700 (PDT)
X-Received: by 2002:a05:6102:808e:b0:737:4cac:52f1 with SMTP id ada2fe7eead31-73cb88bfc85mr324135137.1.1782828968537;
        Tue, 30 Jun 2026 07:16:08 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:a2d4:ac8b:bb21:2661])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bb1bf712sm34105425e9.2.2026.06.30.07.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:16:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] EDITME: cover title for pmg1110-gpio
Date: Tue, 30 Jun 2026 16:16:05 +0200
Message-ID: <178282896299.21974.11820844634980571758.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260610-pmg1110-gpio-v1-0-a9c50cd8b5d9@oss.qualcomm.com>
References: <20260610-pmg1110-gpio-v1-0-a9c50cd8b5d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: omPnGs8Vctjdt2NjVfou9Id9weJJ6F0J
X-Authority-Analysis: v=2.4 cv=KqJ9H2WN c=1 sm=1 tr=0 ts=6a43cfab cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=no4Ac7NHiWzU62rghnMA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzMyBTYWx0ZWRfXzzfIym8YpSxv
 AViViN+OweaCA8zJtzemlpc45wcuPs+AU6SqMe4seNlOhhk60XiM0fsFXvER5YtmxypEY1vehOV
 xw13BDc7w44tah/NbnBsTlXMc852zaxNmkEETkOX07STRwyY7Tr6XIaa/LEWK2M9vQEX2+NjQD5
 l7EIDAVxSx68w4/hnzNQyqKmcWNAAmEozvwTJ62eOasIVdE6kIkAFcLgYZR/uL9T9EJjp3yXZOY
 JlMzGzAWjsHWolpPahPll/8BNQc3k5RuYzDCcdQBNQRozBDswDuH/GtMsCDAYjGhLHzfp3BXh3q
 m0EN5MeT0DOr/przGJtGye6e7RQPps35t3wlGwHyeTPLmVmantyRoAzPUAl1HGLGnsZe3v32i1w
 cM9ngItdX4k+X/9zOzG4wQmap+ZpIX9JCh+8+5qOcNfBiw3khMNPKUiTwMnSRR5zcOVQma6mdhH
 4EMElsBfexKO3cpvqig==
X-Proofpoint-ORIG-GUID: omPnGs8Vctjdt2NjVfou9Id9weJJ6F0J
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzMyBTYWx0ZWRfXzs4aNI+J5i/S
 bdlSYPGAWM4CA0HELoETiqkdemWWT3Oxcl2GnvDG5/pkxDQDLVZGVrz7YJ1HvPsDVmIUCWEKhMA
 zxKB2lalWVMQyC2YUl9MY/jtBsiFAiE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300133


On Wed, 10 Jun 2026 00:05:45 -0700, Fenglin Wu wrote:
> 


Applied, thanks!

[1/2] dt-bindings: pinctrl: qcom,pmic-gpio: Document PMG1110 GPIO support
      https://git.kernel.org/brgl/c/32bd01532af59cf0cc6994e2794e0aaa9af5bc8d
[2/2] pinctrl: qcom: spmi-gpio: Add PMG1110 GPIO support
      https://git.kernel.org/brgl/c/8a762912365d4e7402fb8942934681acd0a3bcd6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
