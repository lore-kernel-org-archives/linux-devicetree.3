Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574763;
	b=VVyMJvLmBh5TKTbgn6A0uMiMOdxellcNqEDLeV+oJhBX87y8z0WnAJjf+y8UdUYWEQMy
	 8PkLOUCxH6hh8u6fxPbletdI2P7DVct7V8tZXUNqEmbMSm89dsAH+8RsKOIQF/eqvPRI/
	 fyPdrd/8IbXW7srGT7C6dU8XawEbzaMqxN/cLkGuzOnnI5X5+Oh/QbryNCQ3ck6mnGWAx
	 nLUiB/HEVNwwDUO0+YZ8lr26ELOG/3xF6330d3F25DlpmyF/4eGd9cxSIw0/k470cMvwi
	 07NCytqSYYWCGx9BRInlglgHbvzTItIHrdc5UtRwSnos0nuEGUrSNvoW29/99iFMarg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574763;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uSuitGcPNAp6kDNTkufpaC9Ibk/iwsakxpW63Y9HaYg=;
	b=hx+5H3A3jzgILq71Jwmhk2H6gX8Vbe13BoBi1DG8q/IJCZ4g9govf9XChtf+PDqOA2O+
	 0QU1HbTppVoJb0d+clSafzjgQlj24ViVW0/3Wz2yRiJi1ObU0Wx9j13GGDSD5XGnXrO+i
	 AY4K5srh7Iwhbb9Hi5n48hz3oUytNB/XpG8w4n0fj2YKQE7uf+mw6ICMRTwk3QhyEi7m8
	 9Sb0KSc31MuT7A8hXzASryu8Jh8qQNmcf2RLNgaAILQxoGIk9D2vwzwM7FiaA4J/N9skX
	 NOx4XrvOcFcBmn7jy/N3GcVUQm7PO/ZoEZVwuMVnd/A50LfZR+ZnG7TNrJloNPwAC0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PG9bddMN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NHDEnhaf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E200606A319
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E200606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PG9bddMN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NHDEnhaf
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L9CKJs214423
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uSuitGcPNAp6kDNTkufpaC
	9Ibk/iwsakxpW63Y9HaYg=; b=PG9bddMNbfwdNRNZcxRiCjIpHPEo/YxS4lJGou
	QEPVRmelHHTCme7Q2rXbEWszwab0GPsntV6umf+3G5wVQLdP1qjjt+NV6YTttFH9
	lGWoojt0ML3ujWkizVmmKiRrlYUGPMrU8cfuITIBYfKojpBAAdU06oHEkncUXJS+
	EVWAk8BiW7TytSefN4iBTDK0BSkhyWXWxvaFRBLeEK9mSlVig+1VouRIiPUw5nCK
	Dp59hIgbW/4IfwPne6wKlKUetwXy/KYyeLQRQA5Ws4NTDx4pIhLjwGqknvrm7a0g
	OgeoKCdUHFM+HKwPEw1Ym9TOWU9LpxuTKIiLZ2YfiynIQmJQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj481pr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:26:01 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36637676140so916572eec.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792574761; x=1793179561; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uSuitGcPNAp6kDNTkufpaC9Ibk/iwsakxpW63Y9HaYg=;
        b=NHDEnhaf/eNal9ZqmE+oCcbccBXzxPAL0TPv3tHBuE5l2jvaoQbxsMocwmiY//54Q3
         iPIBnb//xMAxb3dGhYJGFqoxrjBzZK6DC5QmB4Kn/LTLOrtKsd1BfweKWM+Dzt9IZUEV
         qAoXz7YEfdx9vYFbwq4tJ6qihUr0fIHsPlUAmh+o7byBZNjuAsV/3IjNgQ/Bcc9bMUcp
         cZd/dfovwwGR2vkp2SoM7+PXYOBbGjRlehTu3aFPfxZ+fAT58NP6C3Tbcc6GidTtvkWJ
         4VkMriMUepqLQF6cdigb0F6xI3vFwLiq1fYWxOZSeAvm/XrmNAxoAPDXMDnJtJaYq68W
         nqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574761; x=1793179561;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uSuitGcPNAp6kDNTkufpaC9Ibk/iwsakxpW63Y9HaYg=;
        b=qJMxy0fyzMGUlmzt0BQ8DX17xXhE6ezQ7WOK7Z0AcbGIFkBZ+N7/dsDwUv4qHcmF+m
         r+oHyaZIfmRES6h1mMbT0O6s+JNzWVv9SIorUzn9/44VdEtvF1lOWhAb7kzXth7IX0od
         VHRssIwE95MPdrs+JQeG0NhaSHvsFei7TklBSeJwwepi7fUL9UCJhzzBPtHCLU/KgDCS
         KZeEiAm9iHxy5hTz1SWcUSGOjOH4xhpIxzFBy/mc9FMeGzXn2lkxLmH0qlvOAKaLnqMq
         SsFqYy+e3Rp0De7s3IihPUGUB3P1l662dyHOKc5BEuNLTWp30uzqvqHLen6QjYRUl4n2
         /ZDw==
X-Forwarded-Encrypted: i=1; AKwUvByRpoFVw4HOVeyFT8+pWCUiTSE54SHAH4gL99h2zLUpJn0zTxx7EfTHT85+WhdM5RQpQhWZbX7WYFHn@vger.kernel.org
X-Gm-Message-State: AFq9FYIFL4Oze5xHBpfIzBotz8zQPMfJPS+LldOD/P02bmDo+KeTWxa5
	SrlS71s2WrFANrAIjzoYzbWN2IcDPsdbwcywAZ13dWXRfFa//T8iK6Y4T6l96YLf7xd9LyhwKf7
	uMXRJUzHVlKwLtEzGPQChd2azFBYvpdTijfH9PhGw/NMQPFI5WckOArn3WVC8S3Wh
X-Gm-Gg: AYBFou3sUkIqlK34mkoh9g/Y+wXyUmu4n1epJ4YQM6qiTSB4XJ3OxyGCZghhovI9LAu
	JmwZ46BMg6442kzIKfq2m3Z0ySmtj/CR2oruGTWvT/3AXHIVhVBTkDoZdkcmMRrOdCyd9KVBnPO
	nS8O0ZHo0De7qdpDOAN8/hm4jpHdhqFGFi07ba7jx5eOz/xje75jqL6w+Ex8WQ16uhkNG+pyccJ
	XRtB6Ktu+JT050qe17jzEJaNiMhe5neCypmxMAKKt1EAwd+CejUhXrl4ydQ789ig70xPk01PEft
	S4vMkAsdCuQ+qHBUku2eKtvdo/MvMP55CJiUzdi3T7mhYxjykbjzVjFxmaWelk7TGVMrUu/h3PI
	YV4lk4r2B2QJpFEHRxesafAJa9BC9Wo6r
X-Received: by 2002:a05:7300:6a9e:b0:35b:c271:df19 with SMTP id 5a478bee46e88-3674ec2eac8mr2651356eec.32.1792574760814;
        Wed, 21 Oct 2026 02:26:00 -0700 (PDT)
X-Received: by 2002:a05:7300:6a9e:b0:35b:c271:df19 with SMTP id 5a478bee46e88-3674ec2eac8mr2651315eec.32.1792574760195;
        Wed, 21 Oct 2026 02:26:00 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8439sm6155671eec.11.2026.10.21.02.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:25:59 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Subject: [PATCH v6 0/3] misc: fastrpc: fix ADSP duplicate session creation
Date: Wed, 21 Oct 2026 14:55:46 +0530
Message-Id: <20261021-dup-sessions-v6-0-578ab52ba66c@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIABqF2GoC/3XMwW7CMAwG4FdBOS8ocdJQ78R7IA5O4oxIg7IGK
 hDquy/l0qlafbD0/7K/lyjcZy7ic/MSPQ+55O5Sg/vYiHCiyxfLHGsWoMApp1DG+1UWLtNdkUx
 AgShoRCvqy7XnlB9v7nCs+ZTLreufb33QU7sCDVpqCQ6NJe8xkdl3pWx/7vQduvN5W5eYvAFmY
 6fahQFSyUhWJQzYEvgVw8xGC3ZhmGpYrzRGTpbVmmH/Gm5h2GqYpk4EnzjaFaOZDQSzMJpqMDZ
 GG0O6hd0/xjiOv9PJ6RK/AQAA
X-Change-ID: 20260609-dup-sessions-ea2acaac1994
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792574754; l=2894;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=Znw6rBmsrPLmZf1Xm4uaqF5JIwWwc/6CAx2/Oc7scWg=;
 b=xghwgq5+GYh7ydwRMy0+qeIwLDWK5mN9QP//SG9fG+vHyBfoekIfEE3Z+y1A9En8xk8nlljSp
 I06rkL2HJYoA40vi3w6fx+Nrw5d1iVbtFWuwz5aVF4Scqe/HcrZ4aG/
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-ORIG-GUID: XetOSv7diqoOaGE_uL2NSE7ZCP5DT3fZ
X-Proofpoint-GUID: XetOSv7diqoOaGE_uL2NSE7ZCP5DT3fZ
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad88529 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YTpWxnxjnte_hGW78hkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX16ZH0LCMiufI
 uz1SoAgZhcYATa3IrJe/7enO6MNUlV0uPqQfzi+0Sy43Q4mj34HWiW047Fs6zglCNx3zc323xW7
 oX1y4iuK7k/inwYZjpjFxUfZ0X2EegQl7l/qQn4pkctGMOcJL0MdePY4EHJs6aLSd1uJYD14oTt
 q/kkMRe5mGyzzgt9jpQP6nJ/P7Mgv+q+ROGNisYEyfj2Yma/sVx5CTsQzDdCeYDSzSyx/o4w62i
 EMGK9f8d2TGsVSRGhakVg1VkdNuCgLdS5jdbqbSbwZeLDKnhXLuAcbWxOIs31LfW7oKmo+i/GAr
 obpXmdG0J15tQGgDMo9/TKPU+TS/p4G+jGIPRRLO6kjqlnpJZkP0PpqYp5KDrz+tfck69CmhkIU
 1Whnhp1KHCFbJtIsu52WNzyS/HdslTa8ZelqLUWpBno9LY2ZEjEWXduXhDJHdKEpCsyGtwHv0wI
 XxxlNCZ9gVnSmMdQ30w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX2GBufWKrenDU
 N1FcN0cwvKOcaN1qEczQR1DBvdP5UhX/3qUL6TmxYSqYCQ5kTHx+DGfzecaL+QF92ZKE1v0lx3+
 8MHiuC+T+sQTueC8nVhepu1nJE6FcCM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210037

For ADSP, only a limited number of FastRPC context banks (CBs) are
available. Each CB supports a single session, which means only a few
processes can run on ADSP simultaneously. If all sessions are consumed
by fastrpc daemons, no session remains available when a user application
starts, causing the application to fail.

To work around this, some DT set:
  qcom,nsessions = <5>;
which duplicated sessions inline during context bank initialisation.
Upstream feedback indicated that this policy does not belong in DT and
should be handled at the driver level instead.

This series iterates over CB child nodes directly and synchronously,
replacing of_platform_populate() and of_platform_depopulate(), and moves
the ADSP session duplication to the driver. The qcom,nsessions binding
is deprecated in the same series.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
Changes in v6:
- Drop unused dev_set_drvdata() from fastrpc_cb_init()
- Use device_for_each_child_reverse() to destroy CB devices
- Return -ENODEV when of_platform_device_create() fails
- Add a comment for FASTRPC_DUP_SESSIONS
- Link to v5: https://lore.kernel.org/r/20260923-dup-sessions-v5-0-e953133a1827@oss.qualcomm.com

Changes in v5:
- Introduce fastrpc_cb_devices_create() and fastrpc_cb_devices_destroy()
  for symmetric CB device lifecycle management in probe and remove.
- Replace module_init/exit pair with module_rpmsg_driver().
- Link to v4: https://lore.kernel.org/r/20260826-dup-sessions-v4-0-35555d2bfed4@oss.qualcomm.com

Changes in v4:
- Rebased on latest linux-next (a8406e6c0b79, 2026-08-25)
- Link to v3: https://lore.kernel.org/r/20260824-dup-sessions-v3-0-4b019def4e0b@oss.qualcomm.com

Changes in v3:
- Add patch to fix async probe race with of_platform_populate().
- Rename fastrpc_cb_probe() to fastrpc_cb_init().
- Reorder series: sync fix, nsessions, binding.
- Collect Reviewed-by tags.
- Link to v2: https://lore.kernel.org/r/20260708-dup-sessions-v2-0-da40f9c98a2b@oss.qualcomm.com

Changes in v2:
- Added patch to deprecate the qcom,nsessions dt-binding.
- Kept the logic unchanged; only split into two patches.
- Link to v1: https://lore.kernel.org/r/20260609-dup-sessions-v1-1-26934abb9fa3@oss.qualcomm.com

---
Vinayak Katoch (3):
      misc: fastrpc: iterate CB nodes manually instead of of_platform_populate
      misc: fastrpc: move ADSP duplicate session creation to the driver
      dt-bindings: misc: qcom,fastrpc: deprecate qcom,nsessions

 .../devicetree/bindings/misc/qcom,fastrpc.yaml     |   2 +
 drivers/misc/fastrpc.c                             | 128 ++++++++++-----------
 2 files changed, 64 insertions(+), 66 deletions(-)
---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
change-id: 20260609-dup-sessions-ea2acaac1994

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

