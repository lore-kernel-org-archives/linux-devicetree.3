Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E106D33F598
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 09:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785747826; cv=none; b=GIW8nzUMyOdFbsa+81J3gk6sobtZQFpdzuPzMVXFkHzTaNzk5ZnXv1hgaLLYfg23RouBh0rT/3/3I6Loq6amJMUstVos2dNdlRssT0GsLgUK/O1Hb1AsPtNCoxWkdYCiCIxCPevI5CE1uD/YKkKQDHoaExfwHNV7PNsJOEoXHp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785747826; c=relaxed/simple;
	bh=263fUukRd2gsqjs2cR1CVrD9tSdbDlq0XbC55hmW6lQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QcwDKiHivrRyNK/zoWp9/z5GOc/t6bVhua8NDyUHxhuUdbEXeMpzFpyrkomcnUM2FrkVlRcd0GpVsa/2LbZCcYGd7W7h6iixqwZQhcpJzKLdgXjH0tNPhEbGEWR/CWTTDvjgEmFGOrkZKtPWQMLl/bIXQEC2Im+I66G9tzAX0lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QAd6K3ha; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EwvXTlVP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QAd6K3ha";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EwvXTlVP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736SlTk3759185
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 09:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SCscGo3iB2rU9+PbHk2eXj0coifmdmrexj0FZjknKa4=; b=QAd6K3hacASZebKZ
	qiT0v5xwdYmNwOG0dzQk1DRPjGs/6VM00xR78euV5p7WPLNgXl+llyFbGKvrL/4J
	Ra21dpqCz82ju4pvYqEVvq/OAgL/mUbTn2GT5dTn9PTJPlJxUjLi4ixqBQRMGTq2
	Q11tCGyvVXcykDrm3q60u/zS7q96hD+oJo7qM+UiBOl+MAuWyZMiT89lZEX5E/s3
	t+DZnOOddkz0SZq3E/r6aSwWesvo65WDT/t5gBaZM0+q9bWH2wDzVsl6jSikJjkH
	EAxdtYGVboxJILMmEtVN6YGSY4KVF0/cwiobcSAbcgBUuUE+YBqKPZKODaK8rHj/
	vJemhg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrnrp7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 09:03:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e4f946461so331573585a.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 02:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785747823; x=1786352623; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SCscGo3iB2rU9+PbHk2eXj0coifmdmrexj0FZjknKa4=;
        b=EwvXTlVPYUa79vwVaojNf0nd00xSxiv6AgKlXekVpTzcGVrJyM+bbKCpzLhg/1q1y3
         ZrHcf+sDjMPThqIbbP4TzlwpJ7++7AT0feWDPkONzhgs3JQZDw7P44CdY5rPvdu9YT6J
         Xe6LBBgtTtnanKPQRI+p9GGpIIvdE2BY25lerFZDXMFzecj5gxfz6OcywcVa9hg+dCxI
         0mXhKedaA1ExbeZauHmxUdVWVFVKGkOK5y1y4mkkAC2WBJK+nuVlZGZvsH4dEtVydy6t
         2GHcWPXVz5MHOXlHmQXjzTjIXHs5myuH5ENQQuP70Pkp7L5wPxqozC+WKhee/jLmdTtj
         19HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785747823; x=1786352623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SCscGo3iB2rU9+PbHk2eXj0coifmdmrexj0FZjknKa4=;
        b=LRIMGXsN2h7+EZidmPy4q0Zw/jA5Cc6wyKPtXO7bKmFJf2+xB9N2evq6wTud1LTP9p
         PaH34RM7VcRCFwg656d2zuQd+90goYLf7/Kh0Ob3N1NzseNxW0ikewKHqd/JVL2ChJV5
         swaVgBenKqt3yhCbFE+45WEm54601j6gbwvaRdT9Q6yKJV5n1DIdDIztYwJKo08N1Hsr
         XDOz+InouXSo9pLJhpXqFv6p7q2G73TMAqZ0ZiWkvEmbycjzSwN2kIzIUHYQdL7MhxCm
         W4G/6wZzqBD4sJm13GM7vSWUaJbQ9o9wobQZ5oiYLaSqCkfbcbApJjCqPccKknppkAix
         wzdg==
X-Gm-Message-State: AOJu0YxuqRcsp6Lh7zqJEpSlpBqGG3jubi1j7zCPQGau4rx9byzi3zJr
	v8U+FtkvNWu4YtgIXZgXhbzynBilGds9/Lt7Ypx44Klz1FWvsinkdw093leQtLUiQJHuFpahpLh
	ue9VndfxuJKFlJf8q2/UmSM89XtKqg+cpVmpOlsCkCU+Ygt6aiOaUM2V19EfB5wzm
X-Gm-Gg: AR+sD10J5wBinI9Ff5ahJ8jO14cSuaZxrIoum1m3ndjtMesuvTs4mvg0vFZCD9VVemm
	OoTD4CZEpK1MSAgkeiTmmoyOdC7PJ2y76zDfNQd5prgR090Dn5lsW3VacXZRRWGq5NZ66Cb12Yt
	TmRz6oiZJxWrmZKqTwfhhCfd3ghhflp0ifYQ7aqf6AiFP2bMNeM3iwaIqGrkwAvUQTU9oABUt/m
	DX4IDu7IGGDNuCfCkFHlqKJn2prK0LyDLR6M1VVH8Oqi+Q5mNqlKtRsZ52nGx78WPHMu2UfSFtH
	chzaIjZtUD65ebLpqXnqYKVyjVa0FrXHTv05dClYXLMTb1f0qala14QDlkwSEfTN6vBt69dRlGD
	NN+KUK4lcABQjHUMGbqMEiyGF
X-Received: by 2002:ac8:5fcb:0:b0:51c:e14:87ae with SMTP id d75a77b69052e-52b5686a056mr179805811cf.34.1785747822599;
        Mon, 03 Aug 2026 02:03:42 -0700 (PDT)
X-Received: by 2002:ac8:5fcb:0:b0:51c:e14:87ae with SMTP id d75a77b69052e-52b5686a056mr179805231cf.34.1785747821990;
        Mon, 03 Aug 2026 02:03:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6d7sm31858493f8f.19.2026.08.03.02.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:03:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 11:03:08 +0200
Subject: [PATCH v3 05/11] dtc: dt-check-style: Drop stray backslash before
 quote for continuation-alignment
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-n-dts-style-checker-continued-v3-5-6c9776928cea@oss.qualcomm.com>
References: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
In-Reply-To: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1667;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=263fUukRd2gsqjs2cR1CVrD9tSdbDlq0XbC55hmW6lQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqcFlZTqEgqBHKTJSmVkfUHHgk2riBi3eHoo06u
 pD+jd+asduJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanBZWQAKCRDBN2bmhouD
 17MnD/9FOsCSB/vQcQhhaCL8cdCRXZm1vqJH8d1b2Zrw77HnoFrLzbkXgkifcVzWTF31ZXRXwKn
 VeaDC+b4ItU6h55jvNzNOeFqKtyM2zkKxPTHVV/LLwPiOoHIcJtrfTmmih9FZ8gA2Tg31HghMfB
 eZID90qMkeMfncLKAn6NTrEs6ULdsKxb5Gd/Al7Qp7TnmFuGB10ufZ6xLPHQefTijahjPvelmqH
 cEa4aNt7AU5uQzpQfsZ7JLM3Yv9O+VwmRyvWAJ3LKhwNaLnkgbsI+6OqEzOtKkN/jLmDJ+gApSQ
 hfAkE7ATfdCTgEwqI6k4aMCiwVwF3uDnE3ZI2V0nyqO7fR+SYUwVlKYuusVlo4+ApiRj1VbEQQ6
 h0ECxgqd0WL7qQSBFRob5PRB32lr7ZHIy5bSSgtNwQk7ycOkkUP5Dlz44M/4gVdMXCAvTmjObNa
 CIy/g233Ucj5Hobwl/23a9YpdGY9wnFL+S5/FzMEcepWNsf1jkiMUV2JoXUl15EWVkW1c5JnquC
 STixg/fop0N499WHNFL34Ra9z7ZX4Gx6puTB01X3Dw7H9k83AcWrY+CAQifYYJUVFH5kZP19JQX
 iQvp/CJJuD4Ywux7+9WwWq7OQpFamsLOHmvelvxlNVgtY8pUmElmToi412xNW6+3xa6ipNki62H
 UjY5Mv1z6w/zdMw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MCBTYWx0ZWRfX/Xf8IoQqSr5N
 s0EmYOZz2nhONoO2mtaArIhmWPt79IJY3gjlBLSUedE/GAWNRKEp4Jv4IiuocU1OFivzeIvm92u
 E8jC1h73VN4uOV7ZSax4/uKFmwrP+NM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MCBTYWx0ZWRfX73LI1Ahlb+DQ
 M5G5P/cIsvipg6EFDlGgcXFYGvo9D4XnZZjaZIqh8Aup9HMIg1rsV1JzLAeGhWsYp5g1v7s2oY0
 ebhLPlSCSpBfJxZ1tXO1UD6FXScVDqs26chiLMPZmB5gS+4696Livx0yar5bWpP+sATb5eWozf1
 3I9ifuBZYMqvRBIipO6qYLfdyz2IUoGkzNnUMHhmKEO6XU0ZjkEaU7F2qKgyCJt1FIBzlEfsyA+
 o6CF12sggCuhHMFnYMZUNGq5jvHXYVVyRdCPCrYlkfXwW90zd1Gq1/8OgyqLesHfkCgeP7B1gQR
 16ADirUtxWqDp6uaCTFVhwDwCcu9xh569Y2AH/tgZku7byOgIxsYjuSW83nUS19xfKy5r0dUhoM
 AL5RSrK5yY9XZIURsPNC4QerxR+BQWXludTtFKQyQTx+m3/EQAGb+mWE0Rp6U7HCT4tLEWucior
 Lr8MxU62Bn31DBuHunQ==
X-Authority-Analysis: v=2.4 cv=Zest8MVA c=1 sm=1 tr=0 ts=6a70596f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=oYyeLu5mwHFlQtcaYCQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: hCGpJb4XAtnxgzcJGunaIdImL07N4Y22
X-Proofpoint-ORIG-GUID: hCGpJb4XAtnxgzcJGunaIdImL07N4Y22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030080

Drop stray backslash before the quote character in a warning for
continuation-alignment rule: (under "<" or \").  Since the '"' character
has no quotes, drop the quotes also from '<'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                                      | 2 +-
 scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index f9e5762862a5..bdf36ba9e274 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -950,7 +950,7 @@ def check_continuation_alignment(ctx):
             if _display_col(cont.indent_str) != target_col:
                 yield (cont.lineno,
                        'continuation should align to column %d '
-                       '(under "<" or \\")' % (target_col + 1))
+                       '(under < or ")' % (target_col + 1))
 
 
 def check_unclosed_block_comment(ctx):
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
index b5576dd0f6b1..c0801c56d5db 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
@@ -1,2 +1,2 @@
 # mode=strict
-bad/yaml-cont-align.yaml:29: example 0 [continuation-alignment] continuation should align to column 11 (under "<" or \")
+bad/yaml-cont-align.yaml:29: example 0 [continuation-alignment] continuation should align to column 11 (under < or ")

-- 
2.53.0

