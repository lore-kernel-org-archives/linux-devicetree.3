Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C372DCF61
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 17:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491854; cv=none; b=peGJ4E9A10wgwyTiHY8ijpwpG4Oew4Ph3BuCSPI0AlkoRpC68f/6DnMwwrudokLUOEzdvG34gu5+/cExsyekFR89N60E7ffhEUNJupfn1zEmuPnacTzL3ZoPktjsi8wutA/NLgmjiT2Xuz4W0i3nMaASu/D/2NEf4KbnChpvm8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491854; c=relaxed/simple;
	bh=L81LsD5dt2z80+u6Ly3kb4t/zssWAB/dbbZXYGdYdyo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rN5icI3TxnvkGUmsW5qKlCaoF6AFMr3AoJcC3NK/de/xEp1zJu3vq4P1wKd5BcgrB+vEKBYHcrlAl4G2TeORKL6ez4KNCi4CfGDBjqpnc5JfGH47UzEeuxEHkIHGC7m3HUw6eT1qKvsI/ims/I5eFsWqbBM8i7Sq0HdL9deN8QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LKHR6AX7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gfHRLeyA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LKHR6AX7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gfHRLeyA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAYwP3958803
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 17:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u9V2uf06CZxfh0B2jLj6O+uO2SpqOy2t9fVypmnR/F8=; b=LKHR6AX7vDNXRalr
	H+0r3BPDrxiWXhg+u2ve6mL/sLI7BezJElIw7Bpnq9MJnGxRLFP9QFw5L+jlI8zc
	1ORetvWncn8L83YxDe//RnYKgtfPB2VCXyMNTET3UId/V6JFbaJ98wKx5RIGQick
	W2okeT5l/15lZ3f4qB7e9RGlP/ntLWcup/1RZDqXHBSXI/Omh0dra4bH3Xiezt5N
	qL42WFkp8tWG2M/jGHuhA0MV/Gc7BJZo2ycV+qArfYqdldyD/5ND1xSR50xgv8Gd
	ZbUFjcJlgpX1L45rxQvZdwAmIPubAE1bc6KZeGMuaMsjq3z3UEpK3Vr68yCRu7uv
	XY9BEg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq2y2j81v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 17:04:07 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c98fd65daaso817867e0c.0
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789491846; x=1790096646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u9V2uf06CZxfh0B2jLj6O+uO2SpqOy2t9fVypmnR/F8=;
        b=gfHRLeyAJ3OPlv0Yjrf20SLwctj3GyvoX+2sSFPoDAV3zaPw23woof4/84vKA2sue/
         o1zuW57hOX8NlYovltHhnx3/VbhQl42Uz3phA7ISo8Io5b/CrhJ5kmoqfO5c81AU9XuW
         iWVfZMC9GXLffUNyvKOWDfd7xHSM9QT2nbVQOeigz9M9xqY/qrahBqqaHTAsY+4JiPYF
         FCpwkB/Y4c4xe+beBtdKPtrjZq30lQrqXKkveB5ecDnn8u4Yp0ab/aoJjzon6QBLWoKV
         jXQhStSa295DFEc9yYWUPGEuVYvIr1wCOwzGzsCy4dN9rmU6fhBkI1mMnvOHoed7aLOR
         0POA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491846; x=1790096646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u9V2uf06CZxfh0B2jLj6O+uO2SpqOy2t9fVypmnR/F8=;
        b=ngV2PxbZ1ozY/35ktJ6DGnAylGX82kKfO4cwbdhIM7esB0x/79VviAcZ6SRqkiqKb/
         SD24QT7Pw8jlYuTiUU5uLzbqan56gYOysIQBxlJ9wF3xtydQm2RAOQ03iKWB4kg8gPde
         IF5apJZwMLnLWUewwerME+S8eCW7oMVLvd5hM22/eD5l4pjIkI6E2zPGwphU9hvbBa2f
         0oIFgElr9Yx/UnknGyUJzzGuGeQrEJAbhzFAIj/dV/DUHEfAMahXNR3VJS7LhwkFc3tW
         2E7TyvBvg9/DrB8b1oIyBdjOUe8O2vkD/5xqrGmo1EGtoIslu3RxAZCIgeCTCRPF+0YU
         jKgg==
X-Gm-Message-State: AFuF++k2RlX0GISqa5U3oZSGxab+DJji39vhpVCOERLRqNlh/AI7tCTl
	5p0fpIUYUaeNMmSmiRO82wDP4WhWYV2SlEIRVI5lL+fJWoqAdijJuyRfrNcFLIoIybjaz2bvwFR
	Obvj8t47ed0jmWxLEfNAcWsM9DnoUiqW4bQ0+6q9KkI3aZfHwMrTiz/oAGYuVJRkB
X-Gm-Gg: AYBFou0/jRdEfCIkxZiDyCR0uz4cpEYvlFxsJwOe6xi7rFB7g2rQsM5eB1c/BFd4Omc
	oWuro0vOfh0AF70lNURX0bkPrAzxxtuZpKoErQqBmXh7RwzhyB7BRAFsprmistOSM74AnRGzXOl
	ytvSpmW4t501/PqCkrjO5DeD6ZSJoy/FsxwiLLbcn4X2i2gZ3X2RFkaAzzmICBoacucqgD5p3iS
	y+fSTL4nY2UDY52833AA6kdv2Nx5ni4vTFQ4tYMFZqxPDPb9NDOk4LSwS2nHDs5yISLICXiwGHz
	+h4IKXfGUE4W8TwRRI/CUA7o72dePDLuaK2NBkIADq0haHvkRjvLlm0q2cBbK0Cc82CGWf279Zc
	xSLS03lhuPKFD1D5+TgYfDvs=
X-Received: by 2002:a05:6122:3402:b0:5c8:228:5ea6 with SMTP id 71dfb90a1353d-5c993acb5b3mr4342542e0c.5.1789491846607;
        Tue, 15 Sep 2026 10:04:06 -0700 (PDT)
X-Received: by 2002:a05:6122:3402:b0:5c8:228:5ea6 with SMTP id 71dfb90a1353d-5c993acb5b3mr4342454e0c.5.1789491846150;
        Tue, 15 Sep 2026 10:04:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27df9sm391286f8f.19.2026.09.15.10.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:04:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 19:03:48 +0200
Subject: [PATCH v4 4/7] dtc: dt-check-style: Unduplicate checks in
 check_mixed_indent_chars()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-dts-style-checker-continued-lines-v4-4-5b8e09b11ef2@oss.qualcomm.com>
References: <20260915-b4-dts-style-checker-continued-lines-v4-0-5b8e09b11ef2@oss.qualcomm.com>
In-Reply-To: <20260915-b4-dts-style-checker-continued-lines-v4-0-5b8e09b11ef2@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2325;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=L81LsD5dt2z80+u6Ly3kb4t/zssWAB/dbbZXYGdYdyo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqXp4dkw3KmWdfT6eFBPimWYNRIpSfYEuJiVbq
 rYG4PNmPoSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaql6eAAKCRDBN2bmhouD
 10mFD/0c9I84Jc46H3Cba+JBLqKLI/IEubsbF3GWKEluQuLWxS7OBNcSZeE45kEbidJoeguFTzP
 x3Mz1E/d/ZP82+ePl0BfxV1iJPKhzKPfCCVP3srNvkENNFn6lo3lQ5Nw9pHOfZauq/PU5XAHG5V
 hnCEl4+uz+aNQwN4PVOzFFhRWPmqiskFGDHZYNiBgZs15mIG6jbSnFozaj65vWNSCK5Hqd/4tgi
 blXIIGdavIRtuHA3x3QYa2dNvW9ecA9V2F2gQj/3RSRdO+wnAz3DrW9khkwXqT4ku/II1h5oO8b
 tiQB7PhAtTPN9ypz2AoYdUZru0nX9ZfUE6MihvtdvYWSYIOKXaiN47tJVizE5B/xYYf49f16lWG
 NbAoeXlPua/K8lAFUfznCK0DA7uAZSo6m9UE3VJe7h9SOur6WtjLJyqYBwcm0vtPpLfwuXyok6D
 57s+DE8YVegB1bj2kdfHHJeVQLSrJkpLCAGuxuP6P7U9RVBFJKjny/sjgGHGKvFUu1SwD20GqDB
 Szn+XFAXk4orVl27TlLAM8n5UYUadQSEWOQmw7W4q1eeGCTUzZN2WxpVLYkstiSSpGDS8U3GU6N
 G2NEnWKRlvR4fdYwStlycBE/9PWO6gginkT33WrMvtVyDA2xXrOsTNEGsmOdzP9GPcAKae1SjHA
 6/z6apihTiDvCgg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: pWFlKrcdzTZk0sVubOd12zh5LFMbg_4e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0OSBTYWx0ZWRfXwLQ7AIyrNVqR
 5gHG0zyfdK+zRkKCEMba6gynsf99Tznz08/5F05nZXGOoHOQOP0C49QiG+tY7FCdbE6jlVgNsVN
 5n3K3bh3A4ZTAKofhej1Q+SRHwhuYwf336Wmxe9iluQNQHfN0DPbgIECNpMIkTub+Xo5NgIFwrC
 7KE+9NIFmg2JcOlvTsCVmdA4y1oneNLuraRofgfFjOcKLDw8QJyyvu4V8Dof2EQ5xrecNXjc/S4
 xJGYPxBT0NvsZ/KFJpUDyO1hOf/b2Exj5W+YIxfpwE4kZp3zLfsIZKId1t9zZl2K9DLn9vOaOc/
 XjhR0Ae00KFVqwZpJER0m/1zFhmwSBPA5PvUAS6ted+3vQFeSLBtJt4kSgd0n+ZdH6jLjoiDvds
 ugPVaEaFKjaZSBnIVlu1KFTGjLRqExMhl9Aos8hoyNojxAqrcQFUbo2k5M+176gG72b6eeAXBHe
 UnmkaAP2c7SEjfkvrQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0OSBTYWx0ZWRfXxOFICBzMwzbX
 tEhbFDdxCFjZdTzrAp70AZ9w4RQKvdeFN1r6OxyiVacm+OmLrHraVsLc376QS7lN9AOHqIQYRbI
 k4xG2N7XZ5nel5MzQvZW0AeAnrI1trA=
X-Proofpoint-GUID: pWFlKrcdzTZk0sVubOd12zh5LFMbg_4e
X-Authority-Analysis: v=2.4 cv=IcISymqa c=1 sm=1 tr=0 ts=6aa97a87 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ZNCJMhPrvMW_IMsXWMMA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150249

Code checking each DtsLine and continuations is the same, so split it to
separate function to avoid duplicated code.  This has a positive side
effect - if DtsLine did not have indentation, then check continued to
next one, but now it will still go through the continued lines in the
second loop.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 4ac10cb45068..41c97d996882 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -645,27 +645,24 @@ def check_line_length(ctx):
             yield from _check_line_length(cont)
 
 
+def _check_mixed_indent_chars(dl):
+    if not dl.indent_str:
+        return
+    if dl.linetype == LineType.PREPROCESSOR:
+        return
+    if re.search(r' \t', dl.indent_str):
+        yield (dl.lineno, 'mixed tabs and spaces in indent')
+    if dl.indent_str.count(' ') > 7:
+        yield (dl.lineno, 'too many space characters in indent (more than 7)')
+
+
 def check_mixed_indent_chars(ctx):
     """Indent must be all-tabs, except for aligning indentation (comments
     or continued lines)."""
     for dl in ctx.lines:
-        if not dl.indent_str:
-            continue
-        if dl.linetype == LineType.PREPROCESSOR:
-            continue
-        if re.search(r' \t', dl.indent_str):
-            yield (dl.lineno, 'mixed tabs and spaces in indent')
-        if dl.indent_str.count(' ') > 7:
-            yield (dl.lineno, 'too many space characters in indent (more than 7)')
+        yield from _check_mixed_indent_chars(dl)
         for cont in dl.continuations:
-            if not cont.indent_str:
-                continue
-            if cont.linetype == LineType.PREPROCESSOR:
-                continue
-            if re.search(r' \t', cont.indent_str):
-                yield (cont.lineno, 'mixed tabs and spaces in indent')
-            if cont.indent_str.count(' ') > 7:
-                yield (cont.lineno, 'too many space characters in indent (more than 7)')
+            yield from _check_mixed_indent_chars(cont)
 
 
 def check_node_close_alone(ctx):

-- 
2.53.0

