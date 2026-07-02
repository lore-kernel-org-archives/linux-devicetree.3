Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E52E3921E7
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 07:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977646; cv=none; b=Ig1rlo5SuSo6hJ/MpMMKUQXzPAkYJ8jtYlSPcRYF3iAqeVSn8TkZAXYpIzRHXkI7DJUV0BNkYAba3h16p6+KHjnSKGOLbh1chhl5oonTNONwf3o4ZXw01eflGofBbM5ZcJmIUACB+bXQZp/OSwGEmOnAYzUzXwF0+Nq5dZlDyrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977646; c=relaxed/simple;
	bh=8qei+cZyradtd50ScPvFXNifDm9xbNX0s48ZSZ8pEik=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f3M05XuWP6YtlNSD2V/7PNw8Xsb1qDArEIp4OmhEzve3Y8wXaA/gd/jP41Z3d85TWhbuZ002vtEFMCKw54zQbnUkNvt4t+5UckqAmVhbnnczRUAalIc5mraqdNAGcN+smCpJuYgXTCk4U5HQAwnSmFH9mywALHxvwMzRt7AzqpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D2Dqq7GO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dXEJYYpy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D2Dqq7GO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dXEJYYpy"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KYBX2917613
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 07:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JEalJ388UV7aZKSYSZMD52o4Z6quoMTRP0H
	R3KK1hG0=; b=D2Dqq7GObUQmDZrEuyNcw+sMOoDXzbQCYrE9zdrt1dq0GecKXnj
	YSbZYrfD+zPPHqxOPJHxF4qwVPvA+lXloYjhI3LqnSMTI5pAZmsysYHJNbzEjlmY
	2NsbKSsfPygvPijz00X9DDQAt14QUu8p7bJZpSAMR99HEzciFdh6gtehS1ftHr9Y
	/YnNUwpSs4MKxefx9tkpkwSx7RZrmEy2SyGJCwzLDe6vG/2Nh3YZ4vdFuvqbhIPr
	qYu9lLzpca2ZrubueJBhFWEHBM54cOKDWAqrxwPnZKRTDejstq415gJyQA4ME8cD
	40zQ5U9jVyPFZDJ9mATWf3ekDWEc7Cc/WlA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f53q0bp42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 07:34:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37fbdbc4d03so531196a91.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 00:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782977644; x=1783582444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JEalJ388UV7aZKSYSZMD52o4Z6quoMTRP0HR3KK1hG0=;
        b=dXEJYYpy9MiWy3Bulsnyg4d9ZvQt8Sqzqn0qjvx3X1/yVpwQb2Q+xMvDcM3QGn7GKP
         74BkJsFvi+N87nl8k+7kTqDZz0xB/uiKbrs0jrQyliVjDyVHZ6JzFwbJg8AIbTilsMmv
         ZwTVV79Zemn5kJ4YYm2W0dc+KfaPIRTr2ztd3ZeY4LsM+9kaHrkkRkcXtV/Vstfzwk9y
         o1ojKYj3J50f1e4F7lp+Gt4th9rV1BC1j/ImetV1rfNWXp2ZmFpRN2RbQqMZxNRzx1zt
         EIwXX2ZVZhdj2kK5AFBnL4oI/How6SW1LCYZzEKEMk7b+u2SKJ3pLX0Lgm1pg0RuPn5J
         J1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977644; x=1783582444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEalJ388UV7aZKSYSZMD52o4Z6quoMTRP0HR3KK1hG0=;
        b=Fzfyn3HTv7CDa1HPU3nIDl28Pe9zZwY5coJoNNyqB1db6A6nZTkucaBT7MNEzso6dN
         dNTI5dnUFEnS+34g54LsMe3VOGYgau+JEFLojSiM5pvdwzacVGet46CdGt3G15TjnVmw
         WdXQY5XtT15xWK6zX9+llTrkebfb9nxxav4NECCNDC3O1s58gSS8eVqCYPQbWFXgdJOV
         sS+3hJipBpMb25sZ3k+Rl/CAhMWIppiI+Y+CM86lYbU7Xx4PEpcVtuQUbPTsdpudJRDu
         XfxN15GcKNaro1A3JW1gn+b4PVflEFgWI2szyqGkwCGlaUXCOri3dMV3cwRg9BzPRR9K
         /16w==
X-Forwarded-Encrypted: i=1; AHgh+Rot0S7/hR3lpOrZYic2YIoMaDZ7C9MBJO3ECVVFNjzZs57o05Pwdykq3A7WnCSkwI+cSkTYYoSY8YMn@vger.kernel.org
X-Gm-Message-State: AOJu0YyE0vHSNRyLYM5V7uOoa1yDE8ZPKCNeEj69w+1xa2/m8laafVRb
	vyb8SmqU7r8B5tIoBgrHPZ2xz5bx5mLCxtJnRbmfSH2WsPCHfFYCO+ZPybl2UTjih9KpOozoIL5
	1nyl+G/E/+K6mT6AN8d8mwZ/QZxeGumHlf7sPQlizQEYL42npxZtcLgvF0BouFVVL
X-Gm-Gg: AfdE7cnzg7N4tb94yna4Ugz18qvd8nXNGNvjri76jDA8Ad1TjxsS58AIMJzAfQx4uc+
	J5OEX/p8J+yW7CYIlz77H1sjSkoqP+qtqi4D+4bcTzYm/uUhohSlK+xiSoqS6bw6h32tEWw+1QE
	4Sc642wvRgFskSPbuBUD4bzHJickCWbfBP02aXW1gcwWX88136n3GcUNx1Tt7cIb2FjKFdScYzE
	aJuYPfySVkbImawajluo2qUxykhCChNLh8xLUnam7cvxKi3XVpoA5ybuPaI3hm/8jjATbqBTm4E
	LOdrARJCSJpCaAYmyo29rtmKheU9YovgdlUTC3n++Qssz7ncTNGWvkuwtydK15y5HZ+zYkXEj8e
	YFIJZNRx4gkQGq3Xr82M2i/FASUUL4NeDUoYMAFNEo32cyA==
X-Received: by 2002:a17:90b:17c2:b0:37f:9e21:91d6 with SMTP id 98e67ed59e1d1-380aa1d5609mr4006132a91.13.1782977643755;
        Thu, 02 Jul 2026 00:34:03 -0700 (PDT)
X-Received: by 2002:a17:90b:17c2:b0:37f:9e21:91d6 with SMTP id 98e67ed59e1d1-380aa1d5609mr4006090a91.13.1782977643055;
        Thu, 02 Jul 2026 00:34:03 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e163211asm587380a91.3.2026.07.02.00.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:34:02 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V3 0/2] arm64: dts: qcom: Shikra SD Card support
Date: Thu,  2 Jul 2026 13:03:52 +0530
Message-Id: <20260702073354.3641966-1-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dtnrzVg4 c=1 sm=1 tr=0 ts=6a46146c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1w3StAHzAm3vCDDRDnYA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: _1BPaCNpdmc740PjFXXstKOnUkSMpzeC
X-Proofpoint-GUID: _1BPaCNpdmc740PjFXXstKOnUkSMpzeC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA3NSBTYWx0ZWRfXwuv7sco2lLms
 CnmvovCqGgxilWLa22q837oyC+DlUl1TbLzk7cC5kWxWlD88WhcPB2Uz9Mi2sI5sQ6rz8vcN7xS
 f8l3JuCKPam6bk83L4MoR61N7W92v3qNHI+8w1lFp9oZ8hKvoAJAsVXXg3RvXVYz036I48kM/pD
 1LuR6CpAbrWmORRbdLF4k0rwlhP1U2SYJEG6JSicsdQob2ho4L7Onks6i4JX/2GaazEBQs/H7wk
 35sfXbmJvCiFP36qphcsGi9BwRaHKKRpg5hHUEDij3LoTgnsHKFiMhj28AVwTGlqpf+B0+VhOdz
 jVSuHZhO0P9KAWijgcRo9LI2pCnkbI3RvarKIJuMxEEpxBEYlAeRXRK39pIkm2dtSPOZ8385uJD
 dBVUBzpReINSNpq67F6q8BHrfbBy3nCj/sAsaGJ+DatX54EoixKQbINme7EIWfYR39ZDJL7MJy6
 w9Q1eiB7SAr39aPtYYQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA3NSBTYWx0ZWRfXxs2I5OwQNSAa
 gdeK/mkUiaQ3ZhFfS2sqIV9oD2Jmy5xRWlTl7tMacJkWs3dyq62mui901FVOqFUMlfVzUTz2a3w
 1cUNKO2o6zEn8O9FSG2/Y0ih1WvYQ2A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020075

This is v3 of the Shikra SD Card support series.

This series adds SD card support for the Shikra platform.

The first patch adds the SDHC2 controller node and the necessary pinctrl
configurations to the base Shikra SoC dtsi. The second patch enables 
this support on the Shikra EVK (CQS, CQM, and IQS variants) by defining
the regulator supplies and the card detection GPIO.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

Changes in v3:
- Padded the address part of the reg property in the sdhc_2 node to
  8 hex digits with leading zeroes for consistency with other nodes
  in the file
- Moved the common sdhc_2 properties to shikra-evk DT file
- Link to v2: https://lore.kernel.org/all/20260630165700.1886608-1-monish.chunara@oss.qualcomm.com

Changes in v2:
- Rectify the alignment for clocks and interconnect properties for SD
  card
- Link to v1: https://lore.kernel.org/all/20260604122045.494712-1-monish.chunara@oss.qualcomm.com

Testing:
- Validated on Shikra EVK variants.  

This series depends on:
- https://lore.kernel.org/all/20260612-shikra-dt-v6-2-6b6cb58db477@oss.qualcomm.com

Monish Chunara (2):
  arm64: dts: qcom: Add SD Card support for Shikra SoC
  arm64: dts: qcom: Enable SD card for Shikra EVK

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  9 ++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  9 ++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 11 +++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts |  9 ++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 97 +++++++++++++++++++++
 5 files changed, 135 insertions(+)

-- 
2.34.1

