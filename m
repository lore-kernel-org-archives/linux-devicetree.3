Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED123E3C60
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 09:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779096004; cv=none; b=PvXrYXCiqnPGZ/zRuvzY72SPupJd52t0OZp5k/XgMZW1Yx5yx1cK9Z9QEWMLHAXsBJPJVKw63zaUSV4bFqrTGaHODMBj7L5LblyZ4P5YkYxZQzwl8OJ2t4pcsop6yTIa7ZtucDqC2YPkCmhfRd9/7JRFPX7qhlL+sGl/eQ2Lpz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779096004; c=relaxed/simple;
	bh=MywEWsbnG8C6ngvsR4dw6Oxcahx3+ItSZfhu87dPrc0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZCi4cQiSxudA3Ow5QumYeQ1CZLoBbK2f9e2ILlrrIfSawZeWPvSZ3CwJHwIffs8glilX665DUGuskZ+/q5MEXOfrM8nCic83vYrr1V8rOK4Dwr5wVsD2yYFk1Y+E6MMb1L3KL6JrEvk/IGaxwbvKiSNVxC+Hae7QLjU7LKCf4zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X7xPW22w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P8EBzLNS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X7xPW22w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P8EBzLNS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7NfuJ1912590
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 09:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=I18mqyGP+9h9hQQewvDHdR
	JLfyFJ2fL/hYo7DB9EfNE=; b=X7xPW22wrdHv/qJT1WoxNBi9i4pPo4d7eCtG5f
	OoQPAm8WqjeVdKdn8vlqG85IErxImGX9EnD4ve0fciTehhmp6mqWQg/0vgR7wDeV
	PSioE22RIdZABUPeiZOe6i+OGe2whCPzV+iqrXZ7vRH9+VvX52QZWyx7cWt5WyGB
	nfSd7PHQqbJKtn2ZnyHZ/LgiBHjuzcscXrgzMMWCWTWnKNXn3roBrTBzzHGYALAL
	/0xkPVxrhxP+cxUAd9HjuV/WGdnWTavvKUUJ1bn3QpXm7P/trdc1j+EVxDwyoQgB
	cQqBjffaAfZDPt2ed/ds3B2qBfQnobDazT/OeKjD5nY3BVHQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvcmhn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 09:20:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51650041428so47317961cf.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 02:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779096001; x=1779700801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I18mqyGP+9h9hQQewvDHdRJLfyFJ2fL/hYo7DB9EfNE=;
        b=P8EBzLNSb/r2lWcr2EO/BqCn0sSpuEEzwsA/PanKb/ODl+p/O5YnMvRSW1MwmkQC/o
         NkxMe9QFDanav6B0yQrp2MhLgOAFl7DUtGw/MfEaKT8F5mU+AytM8NK6OW4pfFUMc5wd
         JBY7/Umw/aO5gglCHoahqGwG1cLvLLVRNZh7gFNdusw6IHuzowfcdgOaFWyZjB80+Hhy
         +7Tkygtxk0+zmTh5PJLzDV1ZuSOGvpHey4w7ybI+UhP9ydqVovN8J3qJ8UkX4/2676pZ
         KZXKBXl2THtSXuIhRWrUWcKwHsvrH/3r62PCP0NO4PJDc3a9ZXI08vq5wMNCMvyhuV1E
         +h1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779096001; x=1779700801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I18mqyGP+9h9hQQewvDHdRJLfyFJ2fL/hYo7DB9EfNE=;
        b=Carhj07jukGnGxy0dMEh4+pw/6jzbrp96mOKTBnZ9+hID+uRz9Gd83PKHiOUkCWsNK
         ZrGZob0KwwmmtdcXvxm+tXUbwY7ZNsi/P+bQIMXhqgHkJUkiFbLVvvVnqDwb2D9gM9bk
         zrP38P1mUfR2dNaHdVa1A+AEli2Im+OH4flSkJxTmfnULP1wbI2uTx0I/PSC5t+H9gfL
         ReUdQWkdkq6Fo3FlAbCZ0YXBo973sLZ9I/7DfGb/5JN2z29iGgndO0l/8sCgEl1XFszg
         F1hPEuqRqD4imYoyByrgeNh+ORln3vWmZmLJ3GlCV/PxnyW9JTpqFqDwGt55IZutzeV8
         /s4A==
X-Forwarded-Encrypted: i=1; AFNElJ+gVO1pNOBIGnmjvn/fYWoIvR9t7ZsRF3YllyhR/QXzoIfyZ5Urgr1jOGAJftKLDtbH7fVg6YmHzVXq@vger.kernel.org
X-Gm-Message-State: AOJu0YxaEMuX9eLRR6bJylnrq+AsmGIVcFkM7dwVf2h5vUtJov+Ft9vF
	qt+xm8OfwVzdkUuo2rOrR7fdm6FSPR+m83XHA31RVdjxrY06VbdcxAqOdMhbNMVYPW0EA/mW0HB
	JGZoNO6Q9TmqPo7IC/TsEgQCTBPLr/nyueuKunP1si/eNy7JO5APjJ4zZsN6J1zfc
X-Gm-Gg: Acq92OFQduiB1HeJvUFs4eWbGT6ogIBVYML4ABOb+QEmSQ6Hs4CoeAmHopRQUOucacf
	DTBOdHtHGJpmmGpi1A3O3z9WUYEEY4j8Z2H8HLHj7HwonVMKbxdWnGwnP25RxuUkwTU3WVcLXmg
	jAEbmQaPVvhLIbC+tip8upTgCpbKn+7k8qBMWejWUR9ueZ8g80FSpsl1C6MYiZjYgIgac5DQKqB
	fBzlfKr0W90NN/V09sP7B4KqJRnaH+85jPEIksM2sOXyFXqzqunuUk7MOZc/MBsMgen4JS2II9V
	Xol5S6wSptrw3ftr78+1kX4c6ECoT/j7HCo6gZPEkmX0Ctw74gObMH0ZVwzu9PjMPsk3dXQxLDg
	q5CHAjQ4PIplLzGHQPx5hWruufad99Bxln9e0
X-Received: by 2002:ac8:5d14:0:b0:50b:404a:746e with SMTP id d75a77b69052e-5165a22c052mr194216321cf.47.1779096001465;
        Mon, 18 May 2026 02:20:01 -0700 (PDT)
X-Received: by 2002:ac8:5d14:0:b0:50b:404a:746e with SMTP id d75a77b69052e-5165a22c052mr194216131cf.47.1779096001043;
        Mon, 18 May 2026 02:20:01 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48ff43f8799sm126595765e9.2.2026.05.18.02.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:20:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH] docs: dt: maintainer: Add Devicetree and OF maintainer profile document
Date: Mon, 18 May 2026 11:19:41 +0200
Message-ID: <20260518091942.29822-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4966; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=MywEWsbnG8C6ngvsR4dw6Oxcahx3+ItSZfhu87dPrc0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqCtmumnqtz2DrrUYmcqtjtL+zj9KSzXza91qhN
 4vD8nd0ScKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCagrZrgAKCRDBN2bmhouD
 144JD/92rFjLhf/92xycJGocLdfGFaVBF38rs2t3jyw2nINyTbk3bmFcdJ+qQ15Phpu0nwrjkBS
 kN5TL5zBtS1lWzgth7hPSasnXYt9l2++lAZF4NFrYlCDyJOAidiEUERDRe17D1bubQGN3OoF19R
 1Cyf1d8dmSs/CbTjlcmKrapsiIoOtev6BFfq0QKF7BFcU8IKcTu2Icblo/NjucSLeJqf8cDU4nc
 heI90GMHoADwGCP/r52UdVRXvGFCOAvrJ7ztUJXa9Ob8vqJ8GqTEmIqJh9RZDQfWay3S3Nrnv1f
 yuqkW2/sQFjKfqJGikHL/nMusKn0mNdLcRZwncZLiOXIKOgIcEv5NFSovy5DU2ZRfDmX7Ape2uA
 Bxyw+yfOT5a4GLGMaWKLfQ+4J28x/xnZl0VRhVq1fHvfxw6H1yF9GI7sEOTtK1HA8T0ypoyUCSx
 N9wj6s5lElz1nMJxwsreTkEcxRWzoFY+NZaGOKIJoOcfeNio3tqG3H0Uo2/BPYnKTZNWQbHf0dj
 7rHJctO29PtNxpEf3/L62THABh6WQSpETSgdEipvyonvgXiscVL39z1OlEYN1KS+CvAq3voq1p4
 hG29sIF89P7RxKCuFJEbOl3oJHmrOeV+4/EE4ue5yGsxkDZMy3o2HxyCtIAZm41UPKA37HepIxS WlUVXarRsr8FZOA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4jOfMGhKgdBzYzbrhltS5sVgKIwx70cY
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a0ad9c2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=7C85NsCI5bDNKhsY0GcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 4jOfMGhKgdBzYzbrhltS5sVgKIwx70cY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA4OSBTYWx0ZWRfX8qkm2+mgyeAR
 krFS3FevVnYGv/ay2yY2yWXZuNPOBVJa8lPnjUJ3GZyBAMv7Wn/NJXW0UQEcXkj4/tblLedJd4Z
 zX8Hbx+lZG6UeYf4J+bDAzCKqf9j+BZK81Z2BIkN5dq9r+StswQiUuKg2BpiGbRSD0crLibOlJw
 l2MDSb4Go4gstgMdff1HmYAVo1DcQXxhcm2pUAkok0Ci7kOfDENw+nXf5d8gVi2BfnGpwCDCEle
 8/WHW0Ro964Vk0Crlv7zxAGBbRKHfqxAkqfUV+5bXalCtz0kFZ+0uGon9HKYtuFaAYN2qo7eM04
 rDt37llpDNAYr6NalHak0/CRjHCyi99yBhmbM7u0yag03tu9IexJ3y7ew1PBs7kXxq4lCsorNlD
 gzVKpu8ZA3fl+c/wCr8xJ24m93rOORaU1dxp2u9TQN7bOZuLoI7b1GwNEhARrWWJMOYszROq1A9
 grb7qghFS6gPYI8xqUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180089

Document how Devicetree and Open Firmware maintainers handle their
subsystem, especially focusing on two caveats:

Devicetree subsystem handles patches with a minor difference comparing
to other subsystems: while DT maintainers pick up OF code, they only
provide review of DT bindings without applying these.

All three DT bindings maintainers rely currently on Patchwork and due to
enormous amount of emails per day, regardless how much DT maintainers
try, they cannot read all the emails.

Cc: Rob Herring <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

I expect patch to be picked up by Rob, after review.
---
 .../process/maintainer-devicetree.rst         | 70 +++++++++++++++++++
 MAINTAINERS                                   |  2 +
 2 files changed, 72 insertions(+)
 create mode 100644 Documentation/process/maintainer-devicetree.rst

diff --git a/Documentation/process/maintainer-devicetree.rst b/Documentation/process/maintainer-devicetree.rst
new file mode 100644
index 000000000000..331701bb2282
--- /dev/null
+++ b/Documentation/process/maintainer-devicetree.rst
@@ -0,0 +1,70 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======================================
+Devicetree and Open Firmware Subsystem
+======================================
+
+Other Process Documents
+-----------------------
+
+Please see the documents in Documentation/devicetree/bindings/ for information
+on how to write proper Devicetree bindings and how to submit patches.
+
+Patch Review and Handling
+-------------------------
+
+Patches handled by Devicetree maintainers are processed differently depending
+on the patch type:
+
+1. Core OF driver code, e.g. drivers/of/:
+   patches are reviewed and applied by DT maintainers.
+
+2. Devicetree bindings:
+   patches are reviewed by DT maintainers but, except in certain cases, should
+   be applied by subsystem maintainers.  See also *For kernel maintainers* in
+   Documentation/devicetree/bindings/submitting-patches.rst.
+   
+3. DTS and drivers:
+   DT maintainers might provide comments, but review is generally not expected.
+
+Pachwork
+~~~~~~~~
+
+Devicetree maintainers review patches using Patchwork, so the current status of
+a patch can be checked there. For typical driver submissions, Patchwork
+receives the entire patch set, but only a few patches are usually Devicetree
+bindings that are reviewed by DT maintainers.
+
+Explanation of Patchwork statutes:
+
+ - **New**: Not yet processed by the automation toolset.
+ - **Needs ACK**: Waiting for review by DT maintainers.
+ - **Handled Elsewhere**: Non-DT patch; not being reviewed here.
+ - **RFC**: Patch was likely ignored because it was an incomplete RFC.
+ - **Changes Requested**: Patch was reviewed and DT maintainers expect changes.
+ - **Accepted**: Patch was reviewed and applied by DT maintainers to their tree.
+ - **Not Applicable**: Patch was reviewed and is likely in good shape, with a
+   *Reviewed-by* or *Acked-by* tag provided, but DT maintainers expect someone
+   else to apply it.
+
+Patch Re-review and Pinging
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Due to the high volume of email traffic, Devicetree maintainers do not read
+every email they receive and instead rely on Patchwork during the review
+process. They also often skip patches that have already been reviewed.
+
+As a result, maintainers might miss:
+
+1. Questions about already reviewed patches.
+2. Pings, for example when a patch has been reviewed by DT maintainers but has
+   not been picked up by subsystem maintainers.
+
+Such cases can be addressed by:
+
+1. Pinging DT maintainers on the IRC channel.
+2. Dropping the DT maintainer’s *Acked-by* or *Reviewed-by* tag when sending a new
+   version of the patch set, together with an explanation in the patch
+   changelog describing why the tag was removed and what is expected from DT
+   maintainers.
+
diff --git a/MAINTAINERS b/MAINTAINERS
index f877e5aaf2c7..c4929de50ab7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20050,6 +20050,7 @@ S:	Maintained
 Q:	http://patchwork.kernel.org/project/devicetree/list/
 W:	http://www.devicetree.org/
 C:	irc://irc.libera.chat/devicetree
+P:	Documentation/process/maintainer-devicetree.rst
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
 F:	Documentation/ABI/testing/sysfs-firmware-ofw
 F:	drivers/of/
@@ -20070,6 +20071,7 @@ M:	Conor Dooley <conor+dt@kernel.org>
 L:	devicetree@vger.kernel.org
 S:	Maintained
 Q:	http://patchwork.kernel.org/project/devicetree/list/
+P:	Documentation/process/maintainer-devicetree.rst
 C:	irc://irc.libera.chat/devicetree
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
 F:	Documentation/devicetree/
-- 
2.51.0

