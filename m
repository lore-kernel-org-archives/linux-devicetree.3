Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C833C197C
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175083; cv=none; b=Zo9R8im6eIM0qEtOr6u/ejp3uG/d0Fir0KIB+fHi/PeO3HWSx1INCjMRiTez2QAagA89Bq5paWab22TxFHhbNOjQ4sPjpe+GNzamNTOT1j/15ny8c+UwapBxVRmZrucB7ibkg6uK5CVdemrXhEVe9GGfB1cZDH9mgn57DVFj94U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175083; c=relaxed/simple;
	bh=ayFPy0wIUE3z1Wf6Itqi4sRWCq27IFdSmnp4mJZEsok=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WwS9fqmbZCxJEubbuigeCdi2Re2qgY6hFeVYcUYbSmyYFS7P9YsnYkMnFX5bqZ6umMbSYThYGHeML+o5A8Y8UjF1mpFcnZ0P5ulb5nJ67k7lud4xxDw297HRH123LFp1bplPwvs2JXy7YTwyrgwCsdwcpXoY409s0sNhDi9JCU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WlALzWw7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TKv320VY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WlALzWw7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TKv320VY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J7BIOP353070
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4Ug6IDBbRLbmptWcG+9fHW
	+eYyJhtinuYtZLJuDRfxg=; b=WlALzWw7BmbCyl3B9W8f2DVeFVJcCACZwS2z2H
	xSn9Q0Vac3Fc7GAKbVG4UaUEf0+gFvzF0NJJorT7ICLfrnK1baQL0epxl8Xp8tPN
	dbbYCit1qjWyb2DchsKDhnyhLxmyBFSw3NaFfte+42EW5PMv+889N0f2b8jBmkSl
	pB8y6HH15zivEP1a5RDjUN3ktEzl2il+EowI+9+tXBet/glPsif+XEBsPpF2jFDV
	a/1grwNeXUPq+azXLRuza3LglQo7xPev1pTLgJijDtNrUYXH6IWPCiJweAwIFq+F
	hJniPo1jv0EHMqiM0xrm9wiJPoZXDzwdY9HqRNGXArVMqz9A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xjamvpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:18:00 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1353a6f29deso3683224c88.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 00:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779175079; x=1779779879; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Ug6IDBbRLbmptWcG+9fHW+eYyJhtinuYtZLJuDRfxg=;
        b=TKv320VYHD1/pbh7sgoISDoJXBF182PeFx+Z/av55gLYtVcWJxgfmpNOBIY4odc/Hz
         tjzl0wlcm7KLmNU1emGJyafXGhYsKEOwwMvlC6y/Ykds4cvT1rzFoMWo+Fg54agb38pH
         dYs5hftPwskmNwx1n64AnXz02J5X/7tHx9tZvMpoDiYKx08Fq9zRP8pRxntoDX+yImZt
         Jets40lTIa25T0M9QanXY2l2DF9QpdOgFKL50wQ1q+MakhReThvsCJxT/aj63LpjqBUp
         lLo6KjJonvbhtRUhi64Elib8Lzuwlkw8G8wTEZGjDawqNihzdLiKAk0H+zu6WTIwjhUB
         S/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175079; x=1779779879;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ug6IDBbRLbmptWcG+9fHW+eYyJhtinuYtZLJuDRfxg=;
        b=Z0EAVa5g/4cKp85vh0A7DSbbmSYu3q5+7VzdYEk7fNEl7gWwHHmn6LEJnSk9NQLiJ9
         JjXpxMq92nrmUOxoiLSTSixBLczXoW1SGW1BalXlYrCLbEjV8C9Tlma+9Ilzd48IEAsb
         YFbwwHdAfXvFVWXZSjWDpB+pBKLe+1EzP3sis9zi5lnWpEld8CvthPWnDHjwU/DpvT4y
         VRt19YBheWUTh5VWErtZqsk+3/9nxzLGOU2XupKKeiR76/nyMI8qDW9NyGmCBBcl8hx9
         VxitygNwHG5U7vIixcgzoLHQK+jZdXD5qrLUdX9CweaVbzlxKdRAQ76BHJxnfQuLamU7
         84gQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Ai6llY5w7lEs+tDmyu1xYxJkoF67erSDRSknpD4Dn9I9g+EAMsmilyO2XMpntBpRcUsWxX7kyEPYB@vger.kernel.org
X-Gm-Message-State: AOJu0YxaTeqGF63ZmCs5hQv0coFGe2guxTJoa4h8jxqOVHYXatj4GTXN
	IOtEi+PWQbmjZZgEofcfY1ox1YsxTN6f7v+phYZ3RFsnv1s4mWylZzCt6RHDkKktQBw8IyA/OCd
	NFsnpPF7ru4plLEzg9+9WdsBCDO5HyzfcBVo6Kc4u6Z6VuUeB6gEiBP0Tj0FR79nG
X-Gm-Gg: Acq92OGiji1gbnsOoKZca4JR4dK+uFY/FtsUEaICiKr7jc8zuuva+unyZEhdF6P74p0
	59DzyYHlwhjs5E0riuXavM5ypjhHyKkycPd2dkvv0ii/vSUUtTJO1xq0EJV/eG4NvDBY89ECt9P
	MySVwjsWjXohwH0XUh137TMnzSWcJHOudiOI1/UhEm6KLEu9gBb6/cRPaK1aS1CJH7tFboMRNWT
	SrpIZmSiKxiuM8IEakkqMedLNuGLCchk3bzR+QXVhzFvY3rCD+udexAc4jLpbKLiEYom1+ZH61i
	2Hkn0EPIEKUwwvkynaINEIFXroHzcNNyAFpeCpblAhjYTrKi22D3n7vWP0BibeV4RAxJ29iCL8+
	gt5WaawwPb6WntS+pPxFHX9ahPlLcF9b/HedP4PxUhdM1/rRIKEHsYkgY/9pBGY1zhumXQPMB7k
	bloVzZGc3Q1ek=
X-Received: by 2002:a05:7022:f9d:b0:133:1ba6:f42d with SMTP id a92af1059eb24-1350451e2b2mr9202196c88.3.1779175079032;
        Tue, 19 May 2026 00:17:59 -0700 (PDT)
X-Received: by 2002:a05:7022:f9d:b0:133:1ba6:f42d with SMTP id a92af1059eb24-1350451e2b2mr9202183c88.3.1779175078560;
        Tue, 19 May 2026 00:17:58 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed2232sm23323747c88.7.2026.05.19.00.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:17:58 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH 0/3] Add CCI and CAMSS support for SM8750
Date: Tue, 19 May 2026 00:17:55 -0700
Message-Id: <20260519-pakala-camera-v1-0-b6d897864916@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKMODGoC/zXMQQrCMBCF4auEWTuQtCilV5EuJslEB01akyiF0
 rsbLC7/B+/boHAWLjCqDTJ/pMicWpiTAnendGMU3xo63V302Qy40IOehI4iZ0IbdM+9D8bbAdp
 nyRxk/XnX6ejMr3dj6zGCpcLo5hiljirxWvFPw7TvXzXqaGaQAAAA
X-Change-ID: 20260518-pakala-camera-bf03e3df1db8
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MCBTYWx0ZWRfXxC1N21o1EWyg
 iPMTm/XpEO727VgQ3s35FIc3knnu7+8X/weujJwcSn682HhkiRS7310CRgyx50nlj3hyk6alEO4
 TH6vyIJfSqRBTEanYxXBCjPkhADAgxEmuhFIgyzGXQuifzfJpspgxsxmEbeIjTvoP2XKI4ynUWn
 s7vP9nJhp2IOfHlT4VC/YjwVAHbwLTiRmenmAKr1ml5rXJHE0XcTdQge8mPDec4HRhDwlgO1QcW
 rlByQLANiDcU6MPecq68D+z7Wtp/qqQuqW737WqkT7G9td9uXyLTcnsCo7F3hNJN8GP97nw6c3n
 KQdax9WqvA7BaZxiX7Qc6tPYshnOuGToIMmQwc9nko1+iMiUbq7WT7GwtYqYVn4lacd9r1gwT6q
 GSybRVG9YW6YfVXJOqOu0tFvz+ZlAEj/CsUrixbnd3zoZ2TzjgkyIwzn2kuj0mO/O+acGW/rNDU
 gplAQ0o23dkOOo1PuDg==
X-Authority-Analysis: v=2.4 cv=BYHoFLt2 c=1 sm=1 tr=0 ts=6a0c0ea8 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OFdHJre5LK366wQswZQA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: 7lnIk401RwSuMp5UMNOk21QV89B2XPYL
X-Proofpoint-GUID: 7lnIk401RwSuMp5UMNOk21QV89B2XPYL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190070

This series adds CCI and CAMSS support for Qualcomm SM8750 SoC.

This series has been tested using the following commands with a downstream
driver for S5KJN5 sensor.
- media-ctl --reset
- media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0

Driver and dt-binding are waiting to be merged:
https://lore.kernel.org/all/20260508-add-support-for-camss-on-sm8750-v3-0-fc6861a65c67@oss.qualcomm.com/

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
Hangxiang Ma (3):
      arm64: dts: qcom: sm8750: Add camss node
      arm64: dts: qcom: sm8750: Add CCI definitions
      arm64: dts: qcom: sm8750: Add camera MCLK pinctrl

 arch/arm64/boot/dts/qcom/sm8750.dtsi | 541 +++++++++++++++++++++++++++++++++++
 1 file changed, 541 insertions(+)
---
base-commit: e9c9ed45e9870a5c221ff199fff1fb529f3f1691
change-id: 20260518-pakala-camera-bf03e3df1db8

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

