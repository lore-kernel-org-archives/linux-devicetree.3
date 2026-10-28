Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188069;
	b=DUh7c/OqN3Aqzlfw1wroHRMotRPs/+9i2L1NHtP1wULJbc1Txs4+on0eLPVyX3FHw/ND
	 nBV0z8oIML2cyb4mRmzcqJYBkBAoAe8eD+C42r8v6aoTrJUwp4TvEF8n3eKd77VWQcVm/
	 xDtMWyOhNrMXZ+yGrJZCdzhkl3JNbXh/nw8WQmchBePqSlqrStUWkb7SSTs/Gu0U4dvR5
	 2WA1hnbBgRyB9nfroRbq2XBSUwlAB9Ol7vybK4Qg0TI3rvMvxMwH0l6/YqNDaxpxCbIiA
	 LQOV4WkPQpWIqHITwHx0g5oIa07OCy2ay+zqi1OCpfk6EVempczdG6jFC11x2dw45hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188069;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pCGUXGj4ZDfvuqM5yiaQoMgaic2cUqs7MWwZJYPNXIs=;
	b=TJuzU15H5jvPL2AAaibvL9xTpWxGXTsPIwEqMDY2XEOHPD/KBZNaDXbhw/pt40i46cyh
	 /2AQKIqty8vdRn5XW8/7pM9o5qwSI2fsL+UjznesagiXcQlQthlYatvzxcZKg74THFeI5
	 JjldUfdORlkwDi27RLd9Y2MfkgIm6mmYn1xcGyPzrOH3VN83jjggKVrxf/KkfdNDR7rjp
	 w5H0g3pxOrFet5Muwrk9rfcA3CzmbamI+iSxEFkjiwt5i5+dZCccf96OfNyj0eUpKTch5
	 Y2j325XdfVhQXkUin+7I6ANC6k3tBUBCy2bSocbFswCyqVKj8YgtHCYcWnJB0nmKKKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TRk+cJvT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IpE25sF4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C559606A320
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 11:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C559606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TRk+cJvT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IpE25sF4
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdvb42082348
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 11:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pCGUXGj4ZDfvuqM5yiaQoMgaic2cUqs7MWwZJYPNXIs=; b=TRk+cJvThlrWvgUv
	rRTBz/Rw9AnzGLidu6z08uAbGk4UazAMri/Q/nTdPIfPe8hV0fBdjTKHzWdOUvA6
	SPNn8xzWgw3TVcz50heEgFer+p8rWas3ePyTTEaALZcRh96qm18UZtAmeWtpetOj
	qSWsXZ6ChUZzvjZ5yLXCh3NOf0RQLMQ9kiaU2NqANrRxLVaNjTYKx7PA0Tpr2c5Z
	4N6mrIVMPeA8iZuMvRQIenS6aV+kplnji6LuVS1Cp7UvxiCA76TrEjjalPZ/0wBC
	ojdt6StbSSxUMu4YI6olw05K347k+YDd0+zZ3W9OY5+Ze654i10JQqdhCqR+H43F
	hG95iQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjputnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 11:47:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dfb24dfedfso8323325ad.2
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 04:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188067; x=1793792867; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pCGUXGj4ZDfvuqM5yiaQoMgaic2cUqs7MWwZJYPNXIs=;
        b=IpE25sF4NU4Y2k2B2UhEXa3E6TPUejAGm0/pgxHIsfQjdpZRsbwlhCoLp3Objddv6I
         DCe7msscxVbeg4/grI4tHOyuAQm38fiWoDXXMgQkUo7k9boM5ikjMUImuO+dRzwzrDkA
         hWsntFO4qP3hTIetR0PSxZ1prNgynj4tVjUb12aUzfUYktqaK4Y+MYFtDh1gg/XyCsel
         h+8BE1Pba0a2G+SxmXon/bCozVdowFTLnPBlkWVpAxZ48w/Xb0JoaXvINhs+nFkNu3sE
         RydleITf//n1XUP45P2wn9ekxZa3IBuPygbAR/ISahNuCFDs3dSlalpC4XUINdlzUTuz
         QYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188067; x=1793792867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pCGUXGj4ZDfvuqM5yiaQoMgaic2cUqs7MWwZJYPNXIs=;
        b=TWY4vJnV8WpPyKagT4aoplr2PP8oGNxAaZ9g1L+njOSo087m18VxNqFNmEIBzuPpuM
         21U66Hh5wEoQwZQZCGYl7RHvDfO1ijb1rg0EsxNhNhak9UDpA42N1r1/WKpN4EhR0KwB
         pm6omDJ9wawRH0FFl1eIgU4HqIGL5siemxXzW8gYHV19B1r1XAUMPBUqXiJv4O0mowX3
         QU0hD/nw/LulwyBe1KO4XNb5C4Gb5u1fJTjZvgU84Em8mCPSlS1khVGuY1/uwd2s86g9
         6IqKlFbq64t2lkrQ4hYFJtH+Ow0aLQlaAeHt4imJ94O06Ev7LyZKNFO/y4TTaD2sA6ct
         3N0g==
X-Forwarded-Encrypted: i=1; AKwUvBxW+H+kfRrbQ8GGUkBWKZsmYdFHp8VJV1Ly1JsGFJwci+xbO9yxdnhaicAMHDWdDHBTeG4V1DjG5K6W@vger.kernel.org
X-Gm-Message-State: AFq9FYIptrFhL1yM5aIjwKIzk0MaOYpUsAEm+9XJvdBdjYzoO8pNTEW6
	pkt+EImDxoJclLJk/i8Hzt9DsWWO/4p913+X4ufNkXQT1fs3hcChp0PCuM/2aDkGz+sN6r3Ktqr
	JhoBrZ9VUmz17Gsrf5Ej5BKlNjL+i4bCY5VCV6YizY/qgfckRLFv5rGzw7sLzEZMU
X-Gm-Gg: AYBFou1V0VgmUAlhGS4Lmt22GsIgFAM9cYiAdOsDLM3JfLdyM6eXs+CGx6uTU8ZLleK
	c4QLjuKFoaFe9u5Y9MbPzmEXCx2LNKa09J3BNK3AMPayeWdMfYC0oXHmn2orrSz6TWGnSB09g4v
	EBUfpkQc6Id3VL+3C3PtoIp+ub2STNNw47DCw+9jFi/hsZJpmRTEF0gYLUDGacq4GUtWizdQkQW
	RNQzuTQ/P4nnzuYBAF7bn2zPQSAPJnq/me2E407FmVVhohlVNZSxr8cY8as7rfV/FgCSypXUM7B
	tmDfTt05wIbZzK0Qb3Xlwkw6TXBr2zdflUihlGUJPIZHf5upIxc5ZVWnuCs5BnRywZZ8rjDAtE9
	PLXsnU/GOEHD+jz470UvlVCumY919RvfQZANHJYIdxLLWmIAAMFy5jIog9l3n3y9DFFwt7w9tNg
	l6NWpZLLvAvUqhoVmOiMnir+EmdoYO
X-Received: by 2002:a17:902:c94d:b0:2df:9497:3c89 with SMTP id d9443c01a7336-2eb004b1de5mr18458515ad.59.1793188066548;
        Wed, 28 Oct 2026 04:47:46 -0700 (PDT)
X-Received: by 2002:a17:902:c94d:b0:2df:9497:3c89 with SMTP id d9443c01a7336-2eb004b1de5mr18458135ad.59.1793188065798;
        Wed, 28 Oct 2026 04:47:45 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c37551sm21207715ad.51.2026.10.28.04.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:47:45 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 19:45:41 +0800
Subject: [PATCH v4 1/6] arm_mpam: Fix the RIS index range check in
 mpam_ris_create_locked
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
Message-Id: <20261028-mpam-resctrl-dt-knp-support-v4-1-bdda1e445cba@oss.qualcomm.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793188043; l=1130;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=Fdpc/cwPO/s0yoI6hre67PeGTToBFG3hV8kaAFSlrjU=;
 b=UXyHBEaTAEOkqMTuwB7THPKdjj01ssGYxm/IfpMHdxA7r668oZktRwEdGTTMV42sxolaMW+xY
 FtJ+bPI8nSvAFSvvjAcwSSuLrsk3Jwr1Ce18R83ntKIzfGc9iWxpMzn
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX1WXoLtShpveF
 IZFGIQSgcMRgfOxCxdcjzn3P93ZwOuxvmKIpBTDUfg80GvY4arr/9U4DWVQClZs3fsgKmVCK6od
 k/xV/Nud2Z4EJ/dc6nh7G/97+ZfAwT4Q90X4Num92QJXmS8m2tsYBd7+oZXhP5Uf0SFmgu9GoDc
 Je1Wrvc/QMjF8c10PnbADe6GNVZejy3umOB6tLzIUYKwntEgHOMRSquOFkmz8CoF48MIgKZ6rJI
 9PeDDghR2ns5mDES+40el2KYEJ1AdFJ3X71nJoQotUM0T0XtWiAYj7eFfR9kDt2yJEzA/RlIhwI
 MbOCxEsDwBEXVEIvG2K3labSJJHGHOXYIBRD71uPDOnNcM1kLo0+XnEJT/E18dWj5ngY6Fd2noy
 44EU33Bcm4SmGQARijn2j9sqfOuIthh8mX+iDihTt3gt6vytfYcbbAv56JliwfBEBIOpKol6vTn
 RX33Nm41bL/jvzzvTWQ==
X-Proofpoint-ORIG-GUID: CcImqMAEUzVVX0tuZAoj2hICvrEYv0AP
X-Proofpoint-GUID: CcImqMAEUzVVX0tuZAoj2hICvrEYv0AP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX8HDkRlP18KMj
 R2Wr6admbCsue1PQ8ss0DkNcavcyULVbNNSeNR3OxiQ+I1XOXBKoGHQujskVSzL3pRuBGgUt81d
 IYyqFQPTgXmyDr7/OCBrFYIMMNet+6M=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1e0e3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=cxiLKowE09Ysm4E8lmYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280046

The RIS selector field is defined as MPAMCFG_PART_SEL_RIS (bits 27:24),
which is 4 bits wide and gives valid indices 0..15. MPAM_MSC_MAX_NUM_RIS
is defined as 16, so the check should use >= to reject index 16 and
above. The previous > check incorrectly accepted index 16 as valid.

Fixes: 01fb4b822472 ("arm_mpam: Add the class and component structures for firmware described ris")
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 48adc49b833c..347a5a6d6a1d 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -700,7 +700,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
 
 	lockdep_assert_held(&mpam_list_lock);
 
-	if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
+	if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
 		return -EINVAL;
 
 	if (test_and_set_bit(ris_idx, &msc->ris_idxs))

-- 
2.34.1

