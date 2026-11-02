Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615491;
	b=1nz48dOrdiXg8UyhWJ4RYrGA1MxSijG1B5BVBAiDK+uc4u/z1YNhueUB/EGd/izdlBTU
	 acL6CR9FfLP1ZcbzC0A1oFnetPwgIGkd3Hm62Ygk1+oMkqRGUM5132l2e6oztK+VJnBkZ
	 cr7EsIvtOAEPFKsLir2zc3NuKdILLF5nyHiNlo+AuyNx2EyMjmXBlWFdckKrwSPPLL5Bq
	 4lJFcCedbv7fMNH2UpYf2yl5DnzBz4HBMj3BEKi++SBMcFgGFbBDn9RdAxXb7lH44rOW3
	 Fpqpxh26+hDGWNAcvYiLg5QXDrjZ0ampGv42RwjgOcXsf20v5iPIid5BLjZyJUHAglw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615491;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=X6G6eDi1zFvPjRe676iwk5aDRyp3vEtrjiUQ2k5SddU=;
	b=L1ssG8XLkhF2erX77X+R0u6/jzOd6GGcxWcfCF7NagQ0U0ERnWuQVCkNDHmqi5rFcZrj
	 oUtOSyXLSSQBuz+Zg9KC4sAFvKYxB6lhBlhjIuw53UXWrTTum/1/icVdtSzwYAQudTerk
	 HCetG9dn7jAttH8vJ/Uc1sXDmodUZ7fQXmYB4MsvRMxUXq1NqtxKP+X4l15aRldk9Cbmb
	 uV6MbAbYFlhcI1c4rHEyiBI6EYxhB1H3T4H8q++gQ8BtR2Hy4Yv5Jrf2gmzUiEc+siPIo
	 9772iD1Yv25qNETpCxLKLGEKRKDOCX7Pi+5yGXj01BqbCvAp6UyNwx05PDnGYGneFGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c0WNWCEm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eakWM2x+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357AA606A327
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 10:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 357AA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c0WNWCEm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eakWM2x+
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A7Rt3430613
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 10:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=X6G6eDi1zFvPjRe676iwk5
	aDRyp3vEtrjiUQ2k5SddU=; b=c0WNWCEmf6PuG5yqMvD+XbsBL10l9uPueD4R0Z
	GmQBiRyFG1lIi6+bL/Gk6Q8Of9yD2xIrzF/NzFkiKzo9IlHr1JeuzcTXGIjKuveG
	doEFnvIDapjoYLwO9CoRs9FdUc+EYcIfEgysfec46tMHvLsamo1UsAW6JnjK37vt
	Z9Myiq/1jlputvFZOgNNVgOgpJrUskv67npg+rgLye9uJ8GLCSk5qaS/7mj4krdl
	YUWJTwTum99S+3qsIB8dKWskKcMVl9SeghqV64pi2rylZSV+Q53iM4LCc/YFYlUr
	Nkz3tAYEchLAKWTrnDZWZ6rQXzU1dDyIAdnC/O9d/GktlTQg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmeruw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 10:31:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f33438950so548711785a.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 02:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793615489; x=1794220289; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X6G6eDi1zFvPjRe676iwk5aDRyp3vEtrjiUQ2k5SddU=;
        b=eakWM2x+wZ5380a4XXbHhNnZvesEyB3ywGsgqEFV9vVTeoXi88FiAVxfZpH/CYt38T
         +jWgPlpnI6guUuQ9lSbOjtTJ0QUsQFuOUp1CVko+pxOWIykmBM6WLOQn8sn2iWg4jBCX
         YIoniu+GcBwIaKOB4QM89diVZ/d6quY7/HAZNvmd/JXkuqYoleppBGA0nHOLv72vfq/M
         VNjhluuVJkGdCOUp5QxW4dn1MKgA0nN+ga4jmWeYOsRngePCZeeT4aa16VhR7dfhMjzL
         CK5KGZd0lHHO48HtSvUc065T9uLu85q91g0g8F3XYGR8vc/xQrKQ5fcjNwslLz5j75M/
         7fBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615489; x=1794220289;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X6G6eDi1zFvPjRe676iwk5aDRyp3vEtrjiUQ2k5SddU=;
        b=ihB1RKbZhFnNq44TJhcyVq0L8P4+KC12nsAdnVbMEwtJ11HU+3J64UFWcH/srBXSz9
         WuiVS/ijCwfT4uFjRhQky6YofzK8t757Sxsr20FwaI1f8wrxedHlh24h8ITc38EWP0xa
         6NcKB8sWLOPuZg+yUglJafEbK+sErVOF24IJPMJ7U6m32mTk/QCblIX47kxJYLX51yBY
         CBCsWOiXvnZrANAJ4XEH8tjcfEvLWICWxKI35SQPDseLHysUWJ7mtaxF/Qmn2tp06HTG
         6QA6zkuGo2omWPV3KlV7GfVuXLhYVod4xr6ombtsHSEaoAl7XuHBTxYMPc6AAK6wPF/d
         UYVg==
X-Forwarded-Encrypted: i=1; AKwUvBy7DjXROTSIUBh7VGhC6pNRP1FCVYYdeYcMAAfpIdD71BXAYnWWKMJPvakyOMkiOz35l+geultoXKz8@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6LHJQMOC8uExSInEqTjFwl7YWjuWEO3UYEish+2b8q3lu+s+5
	Unml0wdz0DRCs9sg8OVZRlrOJ5fD/gc8xM981M+ktcxPD2vYM1j8skqK7spvVd0linmRMZaOmzs
	Y6dQ14x6kxmB6Py0XS2Nto/FMedpH1mOc+Er6XyVA8gPMSSJTgtgi/BdwfvgnYd6+
X-Gm-Gg: AYBFou2GEQsfVPFjkGf12XqB/md/dKncoZIlp8bMx7lPuPWAngo/NSu/jsqAO/++mrW
	Hvbe9J+T6h9U+0j1ieZLSczQSVYaXOAWb2d25rTjZScRZ5R3fRs8Is3OCG5KwiMWE1arPq1uhvD
	a7oPVUlXmTh7LHGRS5lbbrvYyJ4fdzpeDDcnBNhELOsIi0QcqXTVwC5vb8almRKArFMxhvEHXON
	2MLbNWBW+TQwnwxWdeClhgwpmxrCte0mmqm0F6WkkEdNHolUIRhK6MPLzOuSLyoCfMCEIGgu+f+
	attSSBfCa4tJN71b2P7v0o+7q74rQ/YJsF1EOH1+6ZLMJbA3r9IUPSIkYynUJa32ytfHWqqSmZv
	hmXq4lX/np+1tQuN7/4kc9mUzd2gcWVFndh3MBzW8GEmo4PUEK/3MiwAQzoAbtis9kGlyZ1b1CT
	GDbQ==
X-Received: by 2002:a05:620a:260e:b0:93e:6b9e:6167 with SMTP id af79cd13be357-9442171c757mr1422081185a.16.1793615489201;
        Mon, 02 Nov 2026 02:31:29 -0800 (PST)
X-Received: by 2002:a05:620a:260e:b0:93e:6b9e:6167 with SMTP id af79cd13be357-9442171c757mr1422078285a.16.1793615488619;
        Mon, 02 Nov 2026 02:31:28 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7c5063e3sm327847885e9.0.2026.11.02.02.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:31:27 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v17 0/2] phy: qcom: add the SGMII SerDes PHY for
 firmware-managed systems
Date: Mon, 02 Nov 2026 11:31:19 +0100
Message-Id: <20261102-sa8255p-eth-phy-v17-0-aa138f2912a0@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHdm6GoC/2WNwQ6CMBBEf4Xs2SVttQU8+R+GwwYX20RobZFIC
 P9uJd68TDKTmTcrJI6OE5yLFSLPLjk/ZiOrQwGdpfHO6G45ACWUkUIoTFQrrQPyZDHYBQ0J0zR
 9U1NFkFchcu/eO/LaZm9dmnxc9odZmm/8g8nTHywXUKA5StFTpxXX+uJTKp8venR+GMos0G7b9
 gGjr1fvuAAAAA==
X-Change-ID: 20261002-sa8255p-eth-phy-6a0699f98a7a
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5874;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8vCGy9/7sKiImVi9rZA9qfojhdTV0k1wjZeJxbHjq0c=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6GZ7BAH01WmS/Wo3hQftVOORD0nMG3Oa8gZN+
 CZlk9qlqDiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauhmewAKCRAFnS7L/zaE
 w6XbD/4qsZmO+n0YYpPG6B/gYIJ6y32akfpdd7Dk84S3weLaSFH4W3jsTLeZPK8LJqjkugwpnz0
 Khv6lhbMkDLe3xXS2zVjZ44aMnNWRzkX6Pi7kFUxQhZ2SE3Wjs1R1zXNh6V/zYQu45Tt2me2sg6
 SM12QUULzctYv+P47VC1nwrpgX+weOYpFF3giebPWDG8WDm7TzsEDOi0F/xnoCfpvRvKsi8V+jK
 LbW7zIzrXSxWrERy3cQxALg/V465nzERV7pji6wPFunuivCupBoJeM1nofY9/hJKTrTJiT3dg1K
 BpV9OyhVEtt5GczvDs+WVDt9+7mkdPxfuV6Y2Y+fTKgdosDONwu32sqHJhIkR7YFovwLlXf3muL
 T9Znh4HO1GLWdBO/0EW4Dh9R2JNrxIfGYDfYMlXZOaE4+tIhXqEinKR6MKZjEZEYDB0jT/itXb8
 u+z/reErzBAU895wL+5dRuQEe+mGBVOu2xKWdyLC+EjrGjywn1vWgEMbV2JCXtfTPXk+9uUXrDO
 SD4SdolJiyL0YyIlItMhEuscqrx8DWT+5GjUAwnAjCK5oIpEF7POpIoNx22cMc3ol9SGl8dg5J3
 skrzowDb4tPucXw4U9i3FgxXO0OaVDS8+lFI7KU8pj5sh1mAEVksZhCehyxojui+l13eZCRoaol
 OCyJQKultaV3o6Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae86682 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=PHq6YzTAAAAA:8
 a=h8s98YD0dNPsP74th3cA:9 a=fjkezMsj8msYObTX:21 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX7Z4AkwWzk8YD
 np02bqUWxr0TY3K2yS3L+uYzFCTdmtTWSeLwPwXZEOFeoVDxpqDwFe4hwYkLauXF6dwDN70BDnv
 nsZQ1EsVMzFOidB9RXKFsUKF6ddtHiC1tRMRZFWbyfdEyPCgiWRFBeXAufBKYpzpQf0H/9gYgjF
 5XVQrRxoZEYx+4WUOmEWBEMQjfbGwk5hQNyeQm0K4Tzfevk/IBil8H3+rryANnzdQ+Q+yI+tE6r
 K8435+h2jIxqdQm6z1YoxtpZEnyiNpbX4xeNNiJKNDpsh8cOvHQx49UTWBt/Fs9XFF5gnMmANmU
 6nffgOS0VPyuaCRe+daUZrRi+MALNwVnRkPumWEV7oxR2Vbgyep53RCub6G5ENj8iB18mGHjT83
 V93cU1SS6ztwHbnCeC7P3RUQKRs33jKsnUTyV39wm/khA+F0r7mXTjIz95t/Or/+XGOteVfgXu6
 /3sRHbGcwlC86eUXCSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX5TSsvTXRCSkN
 Ch3CptM3XEW2e9h/4EdbYsJt7eOMJPhBlMh9EloPm1aiX5EcitlyqcsH2AFzCp1qh6cIMi8IAeV
 8Tlhcqq0b1BNWHeLbBilhapQLpcj+jo=
X-Proofpoint-ORIG-GUID: t1Gp0UrkYhzk1HzNg_tPLC3Wed2BMhyp
X-Proofpoint-GUID: t1Gp0UrkYhzk1HzNg_tPLC3Wed2BMhyp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020041

As Jakub suggested: I'm sending this separately targetting the PHY tree
as there are no build-time dependencies on the rest of the series.

Vinod: this should be good to go, there were no more sashiko comments
and this is just a rebase + a commit message tweak.

Add support for the firmware-managed variant of the Serdes PHY present
on the Qualcomm sa8255p platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v17:
- Extended the commit message for patch 2 (Manivannan)
- Rebased on top of v7.4-rc1
- Link to v16: https://patch.msgid.link/20261014-sa8255p-eth-phy-v16-0-6310fac52e85@oss.qualcomm.com

Changes in v16:
- Split out the PHY patches into a separate series
- Set the SerDes line rate through the OPP API
- Link to v15: https://patch.msgid.link/20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com

Changes in v15:
- Squash patches 6 and 7 to avoid a potential hang-on-resume regression
  (Sashiko)
- Fix the AUTONEG_DISABLE early return path in forced mode (Sashiko)
- Fix Kconfig dependencies on generic power domains (Sashiko)
- Set the performance level back to 0 on unbind in the PHY driver
  (Sashiko)
- Use devm_pm_runtime_enable() where applicable
- Link to v14: https://patch.msgid.link/20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com

Changes in v14:
- let genpd's own runtime suspend/resume callbacks own the perf state entirely
  by calling dev_pm_genpd_set_performance_state() in set_mode()
  unconditionally in the sgmii PHY driver
- drop usleep_range() from the PHY driver when setting the state as the level
  setting is already synchronous
- add missing power-domains limits for ma35d1/k3-dwmac
- fix ordering of clearing the sgmii loopback
- configure the wrapper clocks synchronously in scmi setup
- Link to v13: https://patch.msgid.link/20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com

Changes in v13:
- Reapply OPP on speed change in the PHY driver
- Use linux/device-id/of.h instead of mod_devicetable.h
- Fix the "invalid PTP clock rate" warning on sa8255p
- Add commits necessary to allow correct link speed change with SCMI
- Link to v12: https://patch.msgid.link/20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com

Changes in v12:
- Drop the power-domain-names from the SGMII PHY DT bindings
- Add missing Kconfig dependency on PM for the new SGMII PHY driver
- Link to v11: https://patch.msgid.link/20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com

Changes in v11:
- Take a new approach: add a dedicated driver for the firmware-managed
  SGMII PHY and simplify changes made to the MAC driver
- Link to v10: https://patch.msgid.link/20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com

Changes in v10:
- Fix unit address in DT example
- Link to v9: https://patch.msgid.link/20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com

Changes in v9:
- Rebase on top of current linux-next again
- Link to v8: https://patch.msgid.link/20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com

Changes in v8:
- Rebase on top of recent changes in linux-next which required an
  extensive rework
- Drop partial R-b tags
- Link to v7: https://patch.msgid.link/20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com

Changes in v7:
- Restored the correct authorship after learning git uses .mailmap for
  the --author switch
- Rebased on top of changes from Russell
- Fixed resource management issues in error paths
- Link to v6: https://lore.kernel.org/r/20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com

Changes in v6:
- Fix $id value in the bindings
- Drop patch 3/8 from the series
- Update init/exit callback signatures
- Link to v5: https://lore.kernel.org/r/20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org
- Link to v6: https://lore.kernel.org/r/20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com

Changes in v5:
- Name the DT binding document after the new compatbile
- Add missing space
- Make the power-domains limits stricter
- Link to v4: https://lore.kernel.org/r/20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org

Changes in v4:
- Remove the phys property from the SCMI bindings
- Mark the power-domain-names property as required
- Set maxItems for power-domains to 1 for all existing bindings to
  maintain the current requirements after modifying the value in the
  top-level document
- Link to v3: https://lore.kernel.org/r/20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org

Changes in v3:
- Drop 'power' and 'perf' prefixes from power domain names
- Rebase on top of Russell's changes to dwmac
- Rebase on top of even more changes from Russell that are not yet
  in next (E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk)
- Link to v2: https://lore.kernel.org/all/20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org/

Changes in v2:
- Fix the power-domains property in DT bindings
- Rework the DT bindings example
- Drop the DTS patch, it will go upstream separately
- Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org

---
Bartosz Golaszewski (2):
      dt-bindings: phy: document the serdes PHY on sa8255p
      phy: qcom: add the SGMII SerDes PHY driver for SCMI systems

 .../bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml |  50 +++++++++
 drivers/phy/qualcomm/Kconfig                       |  11 ++
 drivers/phy/qualcomm/Makefile                      |   1 +
 drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c     | 113 +++++++++++++++++++++
 4 files changed, 175 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261002-sa8255p-eth-phy-6a0699f98a7a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

