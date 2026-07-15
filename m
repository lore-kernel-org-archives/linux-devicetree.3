Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254CC443A8E
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784114194; cv=none; b=jeYrNBFmkjrqf7LbsPIbgZu6BuXCQ43YS4OsUj0bfTUCwNMwsuh4uDXm8IPSqBIYuYg06yzdaCqgED0gqpLevA3d/On8j23xbm0xPprGv1GxaaBOexecAEharSxqFiWMufSzD+67y+7i4REvPlr+OgGunyn228QmBn1GsUjX2Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784114194; c=relaxed/simple;
	bh=b8R7PMKX/mJOnKSAzw+WBIj3ErqOG2azS+7mDTf24aA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BvMBnWHFirBQ4+boI11rWy3ksqKHn3DK4StlADT1Dh2IGUAARs3HY+uCeESdgrO4O8i0ZG1MRvZ8HN8HTUVMh6GS4XLld6pkBUvqQVM55FvBwc/1wVsTKaxv1ErOs1NM5lxfh653chOgMCzIpRB41wxopECLI9HqH/SKZieY/kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C6T+UMfp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QXHjiXwZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C6T+UMfp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QXHjiXwZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FB9fAf3631782
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nhogDVqJuu8
	4Y9umWIh3a+QOZfhAgQxd/7sF5vPE2l0=; b=C6T+UMfpT8BjG6k2aEz9pwfcRRs
	z7wofVtgxCGoTVn0Lfy7lfR7V8Pm7l/A5E/Ce7Z5GRsIvED0zN8TquZRfnI1c9ER
	jBmmR8KnmmM8m0LoAfvQ1yzTZJ8CRKp15+uc+IOfE1iBlK7nqe4yR4Kx7nqGYTdy
	zXK5QBjadiIenICy8Cm1PQPNuQjBLQg+GAx98EuHht6PLVZuPxxNNCuJn3aZEMJf
	+clcOHyUB5QQHqecG5SOqKPK+RHMZVeWQCtiv3I6pOCigqFBWjO+hG9byvd69XPu
	nP2Cl7oM1yoON2GeAvi1jqpE5sm8RW2vIcrEVWoN2pmzw6vcFxLCkUYDp1Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe03vj10w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:16:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cae7a8b9easo12222445ad.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 04:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784114191; x=1784718991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nhogDVqJuu84Y9umWIh3a+QOZfhAgQxd/7sF5vPE2l0=;
        b=QXHjiXwZ1f50787ReGmLoov/LE/Wy4+JsdKDK5fTs3Yo2OAfVpqiEMNuicovAoi+xY
         tJma54Jvs6I9VOmFf/bBJUM/WJx7qCJdU+PLJfaeO5jh4mGARtaOCldGlkjep2QCGAup
         dv1+7S0y5K1HrP6cmX4udQ5pC+0RBZM1f7LnRJADg1KefFNC34p7ikRZ1ppw/TSj9CWl
         JnKllidnarh3n9i3W1smL+ao1jjp1f1hl1MEMQyZPPwmHNZlyD97mCE8ZGwEJMvG98Kp
         kWPj98/iRUoeXKbk3O2PgK79oASRcU7uJ4BQLNPdInV/QXubZo/LlSs5GxHaJ3cRTLyN
         m1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784114191; x=1784718991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nhogDVqJuu84Y9umWIh3a+QOZfhAgQxd/7sF5vPE2l0=;
        b=Cefjt9m4CW8J0crGhgXLq4ZYXvSJ8M+VhLKhLehewfYA4yjOf9o3C97nH2tAeghdLm
         86e5kAAt5fN5WIiYRqjFG/rC3Yg0vlVm4SbTrcm40o27XyDlwXZmrhWnu2onxj3tl61J
         nBP3bZ40V3fiXATsKtAlrsPvVT9GwGPAs1VEWfPQQ91S2KW2Rp+SACYYwT7eifNiJtC/
         YGnfzNUklZzHdTqRmD2c2vgWrBgcG1PYFQhr2UgWtbHSkkCSqH3hjjT6/GnVTDVd1O73
         JlwM1n1fqclt61BJoWDWMLaClS/edJ15A5Y1e9Dh4Li7g9rlnNfjYAi1lBQVHPBJebDs
         uK8Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpv1Cdrrv7XSUp1HA5pWvOrtGEeoe3q4fETj0ZE1b1fhSLAuV6aJGAprvBp8zNXPswvsi9EpO3By6f1@vger.kernel.org
X-Gm-Message-State: AOJu0YyMYWTh9eEIJ8Tz7VvGZv/EgXI3Dljwl/7pt5mLcqUj0a9yPl9u
	OoFUJa9xXlDRXEhWCsBfIJKB7hp+aFD3GFZ6N5oLYwflC3B0kie3gXruAor9ydAcuB8hNF7/e7c
	CXieJeXAOb0Hx+Vgo5KOYKW8as5kx2v5IN0+qwUCPG9UFYZJewj62HNuum6NI2Jr4
X-Gm-Gg: AfdE7clAg1lqgQjjAiH1edZMu7t6LcLU6z6rXvMttBwUQwcBx7sk5wgekAKRFq63/z/
	ylDvY84X0SCbHPiwUNiDjVVTOwl0kQ0hXqfhgc2XetYLRHH2YbdIcWmZ3pwalOOUFGV7UatMWX2
	QVR0RAyZJaU1CJvgr6Ib89GKStKcDsF+NgFRPXfkeXk4z7irCkst/HbHShedo9cIkQtxeqsAAFg
	Gyg1Giq1xy2Lhjs6TZIV7E6ht3nQci5rVFizHJnCPi5QM8JCQoeAq9NSolCLr6SAnifrUOt5QNa
	JcomqFLw6MWZ9tJHw4lhcKbByFdNDqG2DbomNzpUt930h89J1rKD9yjryhgte0YrcJ2ilcbAH36
	js0LCCmj58zwG7wdRcJBtxxtxTbAJ8GVq6ogeX/EFfTB9w/syxeuvCVSAV/Sl7g==
X-Received: by 2002:a17:903:2442:b0:2ce:aea4:5e80 with SMTP id d9443c01a7336-2ceaea45f9bmr114310945ad.6.1784114190797;
        Wed, 15 Jul 2026 04:16:30 -0700 (PDT)
X-Received: by 2002:a17:903:2442:b0:2ce:aea4:5e80 with SMTP id d9443c01a7336-2ceaea45f9bmr114310655ad.6.1784114190341;
        Wed, 15 Jul 2026 04:16:30 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd42b2c0bsm471669c88.8.2026.07.15.04.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:16:29 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: mani@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, brgl@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        wenst@chromium.org, mengshi.wu@oss.qualcomm.com,
        quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: Re: [PATCH 3/3] power: sequencing: pcie-m2: Deassert W_DISABLE2# when no UART serdev is created
Date: Wed, 15 Jul 2026 16:46:22 +0530
Message-Id: <20260715111622.2561730-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <bjcmn2euhpik54ytc7falqgcezvy2loimudm6v2ibzxx6autki@rex5cjq2o755>
References: <bjcmn2euhpik54ytc7falqgcezvy2loimudm6v2ibzxx6autki@rex5cjq2o755>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ife3n2qa c=1 sm=1 tr=0 ts=6a576c0f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=cm27Pg_UAAAA:8 a=RcxsvD7BqTzStQuQcmYA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: UBF_JAO-ENH-yZgYRTeX9f-8_yjT4KXo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEwOSBTYWx0ZWRfX77rehXhtT5vx
 e0wCMH4rZUBMNFaB/KoqHNvGPco0rofqfo/+x/mt0lWgY0rqhgbZrD9GBIDcjineJR5jdme/qDS
 JCC6JgxXv9nbPws74DAkk06Qru/22j/LT4QSh/GgIBrMez39TyR94QW78O/0rEvdCHHb7shmSgq
 AK8ZxLg1MWR2jbNJndPEbquLZATh/J2R2F/7XA2tbeOmNp890nzGQauKEmmDC8ylAPrfiB8XfI3
 NldX9q59i6dBoxodkfQpqL+S7tkzZZr3P1hALKFrN6Awk6oB3rV+4EsLFNHbmTeUKiLkYADsUG4
 T2ATZhOoFd4+QXijVB6GNgS5rqslGh4jASYxj8d4VDpaaIMaIyRVdO2BuZHAgUg90E3jje+ZmZ7
 6thYVMmK7D1+q+GjGAC/f2zAKmRK+KWFu67jozC0sfZfi13XRZNVd08Nwlqd9nhc/HDD6EBFwv9
 H6K2fCaN9kJELTOAM2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEwOSBTYWx0ZWRfX0VKorRO12P0m
 VT8kJ8pEUS0fyqyFast9V6PgWeygUqhWD3E3itq+2iCBFB5L0Ptwwpr4ptg3FKuTfc+fbWrBEni
 jRkw6lak5Ofzo/8RyBYFbqp9YMyTdas=
X-Proofpoint-GUID: UBF_JAO-ENH-yZgYRTeX9f-8_yjT4KXo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150109

On Tue, 14 Jul 2026, Manivannan Sadhasivam wrote:
> On Mon, Jul 13, 2026 at 02:46:16PM +0530, Wei Deng wrote:
> > On Thu, 9 Jul 2026, Dmitry Baryshkov wrote:
> > > On Thu, Jul 09, 2026 at 12:59:42PM +0530, Wei Deng wrote:
> > > > The pwrseq_m2_pci_ids[] table lists PCIe BT devices that use UART as the
> > > > BT transport and need a UART serdev created by the driver. When a PCIe
> > > > device under the M.2 connector does not match any entry in this table,
> > > > no UART serdev is created.
> > > > 
> > > > However, the BT subsystem of such a device may still require W_DISABLE2#
> > > > to be deasserted to power up. Rather than adding every possible non-UART
> > > > BT device ID to the table, add an else branch that deasserts W_DISABLE2#
> > > > whenever a PCIe device is detected under the connector but does not match
> > > > a UART BT entry. This allows any BT interface on the card (USB or other)
> > > > to enumerate without requiring explicit knowledge of its device ID.
> > > > 
> > > > The primary use case is USB BT variants of combo chips that share the
> > > > same PCIe device ID as their UART counterpart (e.g. WCN7851 NCM865 USB,
> > > > sub 0x3378, vs NCM865A UART, sub 0x337c): no UART serdev is needed, but
> > > > W_DISABLE2# must be deasserted so the USB BT device can enumerate.
> > > 
> > > Instead of forcibly toggling it, would it be more sensible to tie pwrseq
> > > into the USB too? The onboard-usb-dev implements the same idea (of
> > > powering up the USB device), but it predates pwrseq.
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> > > 
> > 
> > Hi Dmitry,
> > 
> > There is a patch series from Chen-Yu Tsai that appears to implement what
> > you suggested:
> > 
> >   [PATCH v4 00/14] arm64: mediatek: Add M.2 E-key slot on Chromebooks
> >   https://lore.kernel.org/all/20260709095726.704448-1-wenst@chromium.org/
> > 
> > We have been testing this on the Qualcomm Hamoa IoT EVK with both UART BT
> > and USB BT M.2 cards.  Is this the direction you had in mind?
> > 
> 
> IMO, we should move towards Chen's series.
> 
> - Mani

Agreed.

While testing Chen-Yu's v4 on the Qualcomm Hamoa IoT EVK with a board
that needs to support both USB and UART BT cards, we found that the USB
hub holds a reference to the "usb" pwrseq target permanently (acquired
in hub_activate() and never released). When the UART BT driver later
calls pwrseq_power_off(), the bt_unit enable_count only drops to 1 and
bt_disable() is never invoked, leaving W_DISABLE2# deasserted. This
prevents the BT chip from being properly reset, causing the next
btmgmt power on to fail.

This issue is addressed in v5 Patch 14 by splitting the Bluetooth
pwrseq unit into independent uart and usb units, each with their own
reference count:

  [PATCH v5 00/16] arm64: mediatek: Add M.2 E-key slot on Chromebooks
  https://lore.kernel.org/all/20260715085348.3457359-1-wenst@chromium.org/

The series still needs review from you and other maintainers.

-- 
Best Regards,
Wei Deng
