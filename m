Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793954443;
	b=mSbBo/BlrZ3itRz+zwS9dvjVCg8uLIQISTc4RANw/SvL456JfywbpF5ZSRPkRN30q/oq
	 kCCHOJIBSTuDnIpCLDwkB50+fmNLSeByub5s2VR4I6ehVoeuKgl6ZBTrIADc6iByiLMz4
	 OGejoJa132yQXtzNysOALAHxN5FNoJRhZf0puRE8DcAd5HuDo33/DI68ov0ktGSsRZsJG
	 DTkAUi4qjbX/WZDgfFPBoL9ebviFCOPUEyoRK52pFYWtLSRjHrycntDT4Xk3es9sP4KM+
	 cg0oEMarzNhF3ixPqyZ5H4vFgR1MYWU4Bmkv+lDkgDSMopDst3RoOp0grBwGL2+DULg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954443;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bQeOYnGvqbTAAl7dd0qrq6a1Byn6p6nDr0JV95jdOhY=;
	b=c88D+F0XrBFNLsaPrMD3sK3tdfX1gKOL1ZSPxgiPSrY55GShms5n2sX2rNN9AsBYzH+n
	 trVLrHvMd+6sJV0pyQNUe2c8PZ7xhY1BHAZVVLRPZzlQsha0Dlk7QN36Y1Mvp9/EXQiXQ
	 Pork/ZbhXup2XJEgnSbc8gEhEVigO/RYFdWUI6HyNVTbftY28G8ZrV8nI9iJ394ncZYEc
	 40djdADc5140o9q+PtTz6j6sAPB5uz3CZziofRnGXprXjm1OLzMpzTAvqZulrRreH4/pv
	 SBNIaHxR7+mTSkBzdw3JUFpgq7TclwPkdLtGOi0u/mecxXPnAcmF8GzJqphZ/zVhOBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y6WAJTZd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bqlingq2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36BC606A329
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 08:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D36BC606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y6WAJTZd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bqlingq2
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RAF82334005
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 08:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bQeOYnGvqbTAAl7dd0qrq6a1Byn6p6nDr0J
	V95jdOhY=; b=Y6WAJTZd1u/Qf+XFrIvyqrGeuo2yDlYMsDHmlXYf+5EyYBDyOtB
	NRvOvt6gIA1UEqyrDvmUGOoHBU+zqFZcP68cg+hMiSX0y1Tk8fkwJx/xY/5JFHVL
	Bdzs7Sk4OZFW+j+huWxv48H9kfx+q9B0+JdIXzEsGf2o1Dcfo8aElV0OcdLwSjEX
	alGvU4L3CciY5s7lMS6y26b1jCGdFDycoso7PhN55cwEOFIUh+yuy+gcL0ar1mNP
	AYPk8kE1XyTJVdrxnmLsaM8ZWIts9Xp+TmptqgBC2vxvuIT1M+TWOCZQ2di3D4Kn
	b6d62YkDUNJtl9QYNr31+PBMbd+uYG9trqg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9a0hb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 08:40:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0a9de9c2aso367057a91.2
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 00:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793954441; x=1794559241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQeOYnGvqbTAAl7dd0qrq6a1Byn6p6nDr0JV95jdOhY=;
        b=bqlingq2dRumKwx59JSA+xGyZOIvmNki7T+qE/7hzPnsf1wbHnZoK9mY7GVFYTxt4d
         zvidumjuxAcpI3/kbkO+vWU1XFbqWUMVRV5imkFZVPY7pHk5sIwuY+ZEQfWPNhMKL3pS
         zh/JgNcPKdNfcKqUEi9Gy/UJaH1wFBGAOLggQZ5UfnWql81MJFM3lse63VZ1NwYddq6y
         qFwDbvckjBsIDR12wRvW8OoWDNGphVtWn4fra50RS4DCE5iR7fkbEJeUOlWbZ+rxg3cD
         rv7wKb4SD+/xi1VoPMiEsjIvtSm53UXQoUzMaQ2ncNwnfYHuNFLshFUHxf4bXIiTdiiV
         FpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793954441; x=1794559241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQeOYnGvqbTAAl7dd0qrq6a1Byn6p6nDr0JV95jdOhY=;
        b=xz9eH5ivZSjlMjTBEYJ1pyHEZYgm6Iku4WLEZMAHwWLAHr6IbptoY7DQioSnA8vcUV
         3FZKj4eB448KUFDRFhHYcnoQvp4m5IhIsICaj9a1/uCkrxNu6wb4X8ryPRpw5jO3Q6xk
         1cOUJeJ/vmOhsLM0gDrtdLhN+p8ldKHmi/RELlU+l21hR3W6wTNTZH6AN5CpUJl0xszs
         91h4X5g5iut1oEHWO9yGaoa67xRGGI+QfII5Mja0/pN+nXjZ/EhMPOPkY6Q8zy0LLwa4
         SZ/Kohg3VtfvIDVWLK//1yywbqvnKTyPwZQ7V7x79LzdN6ETHPeCA9so436OM7gxbUJY
         mveA==
X-Forwarded-Encrypted: i=1; AL+hErGp31iadN7aBv8qa2XpJfQ9Z0SzAjqNrVp6hxlr5gbvLwav58/wgkDl7+S71Znbx8VZesq+N4saIqxS@vger.kernel.org
X-Gm-Message-State: APuU4Z+eAWaS5Sh7x3v2xRv381NKW8HCtaPRnCvGTe1MxJNC+LehqMKl
	QJ9JH9zx9eIBilbjoL4TzyH1meh/15Xl4LCDalcA97VbJs3jJaO5tITE4xgCcL0C7Ot4gT2UE/8
	hRahucFFS0V1Vv+XzUkPliB41Shzg3jDR7h5Ekn3/6WXz/jK4SWIpYuIKigeYg9D5
X-Gm-Gg: AYBFou0UoMjDdevbbo2hIOokJcVt8KsNY6T9fMy8swt7L6cWS+N9Iw0NaAaTYBOweHo
	ysn6IcQkUmXHpUc1u8kj5ECsfRuqLqpyocos8cJ9jAcFGGHuQKQjBiskKJMdtmwRrORLNoPR1xT
	Nb71y/xCEhfcXuK6naJMFJ+i7APTKBHEQ/g43bRi2+Xg8C5gmXdXFTsnpCy9euZHSZ3D2Mhjh5J
	VLZR4MKfMWBwo+UuTJdgvdPCmycUXCJQnqBGPyR3gSQas9MUr9gwwzt2UZeGRfpUjipjQz+1H4X
	szxbGINNpsYewWBsmqscMzp8JiwJDcH920b/o4DScdFv0F/0fN84bTm2NzLjCvn7qKUnb+rVg/M
	lKi7CQFXTzYtBPpwSK3qPJT5auiee10JLU6Zku5v10UghtRfBJiklWwcW5C1QD1cgJO1Jg9BoKw
	QTBXMNIsU=
X-Received: by 2002:a17:90b:4b8e:b0:3ab:1481:69e5 with SMTP id 98e67ed59e1d1-3b0db6c998emr1894983a91.11.1793954441459;
        Fri, 06 Nov 2026 00:40:41 -0800 (PST)
X-Received: by 2002:a17:90b:4b8e:b0:3ab:1481:69e5 with SMTP id 98e67ed59e1d1-3b0db6c998emr1894959a91.11.1793954440903;
        Fri, 06 Nov 2026 00:40:40 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e253e9bbsm683947a91.0.2026.11.06.00.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:40:40 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
        johan@kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, songchai@qti.qualcomm.com,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
Subject: [PATCH v1] driver core: Demote "Fixed dependency cycle(s)" message to debug level
Date: Fri,  6 Nov 2026 16:40:34 +0800
Message-Id: <20261106084034.1579494-1-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: t94M2EUBm_H6A-ZUntF6Y0EG_FEh0iLS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNCBTYWx0ZWRfX9iguTb+yzlsW
 BUm92gMDEB29B6DZ/FKKYX3ia2K7kkaUkO4HIxvKTT8borCEtsYg+NUlo8ygvHi3X2wDI/L/Ml/
 GWJgr2w4FjZBmRxiq2biR2M9sPXjF4YAok8o7H4Uw8Uct5mtGFLdV5IUw3Zh2tYJq1xNUNB4/gv
 5vVAgIwDKhkUtFOA/oqLaYPvij6QLtszeyK+3xUTQYwWP4Qx30sw+GZez1IWVYwZq615Hle3vZD
 Y+lyEngN+84EK2BLR8ZBikk/ai9EdjlhKCvFuSOjvoFwZvxK44ChqMZEjg4E6esuihlUW7YA13z
 yHzV407Ek6z/HDhGubD3oC97iPDFtVw55ZPff4srXhiM1JOrPcXkbf6oEfm0x78+lXgitTrGSQ3
 xJPsQOyuVaaluOMwV6ynK3ExZUSjTI3BSmqDxIrlNg1OOAQoeCP4O926oksh3rMt17uw/z1e8MC
 FKptdJxDJoJnDhBUKlA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNCBTYWx0ZWRfXwbMBOuUWlRDy
 46t4D/uTYRmHwRBAJzKAqTsEhfcy+7jEE0+pzFg7YKFK2GujK7GkBwKWvTAkcfh4kE/GaEh4WAQ
 cy2nYRI0AI/MX8XU4qvbzv+qX1nG6nM=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aed928a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=EJ-oiV5rZAYrcyJa4SwA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: t94M2EUBm_H6A-ZUntF6Y0EG_FEh0iLS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060034

fw_devlink detects and relaxes dependency cycles automatically, so this
is not an error condition requiring user action. On complex DT
topologies (e.g. CoreSight), this message can fire for many node
pairs and adds noise to the boot log, even though it's primarily
useful for debugging. Switch pr_info() to pr_debug() so it stays
available via dynamic debug when actually needed, without cluttering
default boot logs.

For example, on sm8750 this produces 125 such lines in the boot log in
total, 80 of which are CoreSight-related, e.g.:

[    0.057190] /soc@0/funnel@10041000: Fixed dependency cycle(s) with /soc@0/stm@10002000
[    0.057211] /soc@0/stm@10002000: Fixed dependency cycle(s) with /soc@0/funnel@10041000
[    0.057229] /soc@0/funnel@10041000: Fixed dependency cycle(s) with /soc@0/tpda@10004000
[    0.057249] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /soc@0/funnel@10041000
[    0.057254] /soc@0/tpdm@1000f000: Fixed dependency cycle(s) with /soc@0/tpda@10004000
[    0.057260] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /soc@0/tpdm@1000f000

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 drivers/base/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index cbe05197d4a0..da4f7ff2ebcb 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -132,7 +132,7 @@ static void __fwnode_link_cycle(struct fwnode_link *link)
 		return;
 
 	link->flags |= FWLINK_FLAG_CYCLE;
-	pr_info("%pfwf: Fixed dependency cycle(s) with %pfwf\n",
+	pr_debug("%pfwf: Fixed dependency cycle(s) with %pfwf\n",
 		link->consumer, link->supplier);
 }
 

