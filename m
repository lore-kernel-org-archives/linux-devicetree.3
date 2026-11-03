Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722389;
	b=4RiAWrpByyXzbSg1XSvNnOfW4OnShyzU+SJiVPNQM2C5l81u3SgzL2+fD/+/pX1D0yk7
	 SIr10IAU0nwm38euLvkmxVakf3/XDJ22/dMXIrXkOsFXyDrExvvxuKHwIXDHQbCNWclzz
	 QepeHj0hx3G9DwQGA+Q3X9MDYkVwTKZAsh9a5P6Ft4/wgjB/hlw4yXvlduP4wk5nCtpWP
	 6PmEiIbEvANsVJKNFz6b+Apq/KvUCxeNGn6YanLqMIxIJ+bRUQseqKXUrgyR6skX6toHw
	 safIZCRcOC2/++GUkQa9hpS2NQu8q3MNaTxHJhlrMAjwZR/n8tYA0XATyrQ78z0mMqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=lZvKug11Qy1xOLHr4w2brybIfbioQkbDZg8gHZ1x0Vg=;
	b=M7sGk12nvQkMg6jUGQkTnleKfEIoRO5iP/ChfjmrtiPWVo9NiLfN2RrwKppFyHmmi6Hw
	 5jYubl9HW80yGxWQwfTlDFj5weg7TORMvA6bMKWK/tPwIV6GkUJD/H6ArlpuaPdyeeZ0K
	 6vp02giPLIXCWZiUyoqg1WIrzoDWX7ykINKenkx1Zq0B9eHuTriOYOBH+L63iJGqOTUB1
	 L985MMQYaiT4dlSawCS13ymDmenEd0nWl+c53y1UwZPn6u++R146t3IV/e1g5CYyvvPlo
	 GIyO1rc6YgyipvRIjsBvRI44JH27OHKujpU55RTAaROF6i8xCS8l5GYW3oRyEbHjmjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=beagleboard.org;
	spf=fail smtp.mailfrom=beagleboard.org;
	dkim=pass header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=KJsQKIiU;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B906083602
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 16:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09B906083602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=KJsQKIiU
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35829219da8so971536eec.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 08:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1793722388; x=1794327188; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lZvKug11Qy1xOLHr4w2brybIfbioQkbDZg8gHZ1x0Vg=;
        b=KJsQKIiUye9c4bySIE7fMcNiKRKjWCFbfpFxtOfzdg3cXG7wG8op8njz3Jt/xUATjp
         aj6P6PY4Zycjx2SQVEcYSiDh2hW1s7RJvHYCAIdbdXtfTwMbHx2f+n5ZtKGTWqUqhKtH
         vVOdMMsfVwormVvVcsmNXJIgzrGKFoyHydzSJPHuiMJ5soaNNazX7u4slV2jmtDEW7hL
         H62vvW31/t3lMWvPhMi8P18tIuLi1+sDlucz7yUpe6MHW+4DAfqNe26YAm2ga8km4MB0
         H9xiWsK+eNjFoG6IgWmpSe1tsFFyJWghY9KGLv+2+UoO30KsaxEa/xDZvvxlxjMjYJdB
         druA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722388; x=1794327188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lZvKug11Qy1xOLHr4w2brybIfbioQkbDZg8gHZ1x0Vg=;
        b=R8kDtWcypcblJrFzwlYL5tWrmUgoVBk7cyUo2cmf2d5tbSwjlepiFasatXohImWrXe
         Mek1fNVy3te/8m2d6JO5tVilb8Ek7eg4Y6LvL90Igh3vFnI48lyc0xkY7v0UKFi5zaEw
         R4Pky4cAceHvn2L2K6FbFbX7iMzFhPzIj/HVb4wXM7jK7SuKbe6acJ1Xzjc+lz5tDlqu
         J0jgGrhWCluLoiB0k7x2TTe0a2wMvsZn4ZjYOMS94xGzXDRd4RgqhNfxPiTKuiZzeC56
         02P3kmj6M9CTnLNljfOeTxIwX2SgHun6Z+hd6x0qo7KygXFhT7bcBYi366x4i1cPvfAT
         TqWw==
X-Forwarded-Encrypted: i=1; AKwUvBxXbeOn23p1rJcEnotjsuy6uNxOGWGbjW2nf+dmUvRf2fOGZziqsjiyX5KUfFYHVR/2AnBHYnd8bMaq@vger.kernel.org
X-Gm-Message-State: APuU4Z8OB8CBgFnhaLQjkIT6mBhabWIJcWlyw5g5yirEMLPfHlruvOpQ
	O3pNP0u4xJtWEHwEqYasUn0yGqZ6afKLbU+INo6hdyHO3vPk6gG1Fv072qUMcBgN6Q==
X-Gm-Gg: AYBFou3ql6Zxm+if4IFtDbwWcGzYWIQnB2QSixKLImymvm60yzqTw4AQK21fSdk96mv
	brAnn1zMpCwRbA7PdqC8oK5Xdw4tJ831hNWTcoSAcqeOL3gLJd6wr75+PB8xC0MAYRXqubTejSF
	klaKg9y0jGPFt19i0qwZstvS6xqzpnwMT/hvOAs6Bs0XK28rtERZ9kd7EH/ovZ13rzLz54xz7Ni
	Txu4yvKOMjKoxaQI5vv4gwJSor2D3eMUu+oBVGQHS3SPc+TgP5VQHIZtghn8ZIWxSelJrv5AbOm
	iRtsuIzXKlNtrSO74b57tqD7Fqxg1N3nbuXnUZ4raNQaVNky3BToQKPD/JheFwvOYS9cA9TVWPn
	6LyNoPc1sThi2iflbADxo32MhEeIZvUZWAr7TXjYEGrrX5wktYnA3NlUN9MJ4L9X9Pc87baxvee
	M2w/Euz64MKTEkdc1IaRaXLi4zuzvyr9+guOxUbYq1P+XXIbBoGS1tbO1V02/1YQG8sWB535t9C
	lq3U9y7FpfKBTG+eCp3jamjPP0YuUctzH36xN/dxN13DWkEPuWZqRaOoGAOlQjNCA5KK7KHgL6k
	oPGN9xsPC02Uv+MyKeVwlG/PG+6IurXT7uIX8uTU
X-Received: by 2002:a05:7301:152d:b0:36a:79cd:12df with SMTP id 5a478bee46e88-36a79cd1c3bmr4623541eec.9.1793722388005;
        Tue, 03 Nov 2026 08:13:08 -0800 (PST)
Received: from [192.168.29.54] ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm47214021eec.6.2026.11.03.08.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:13:07 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Tue, 03 Nov 2026 21:41:51 +0530
Subject: [PATCH v5 4/9] greybus: connection: Add
 greybus_data_rcvd_by_intf()
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
Message-Id: <20261103-gb-uart-transport-v5-4-f8e326d6561f@beagleboard.org>
References: <20261103-gb-uart-transport-v5-0-f8e326d6561f@beagleboard.org>
In-Reply-To: <20261103-gb-uart-transport-v5-0-f8e326d6561f@beagleboard.org>
To: Jason Kridner <jkridner@beagleboard.org>, robertcnelson@gmail.com, 
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
 Ayush Singh <ayush@beagleboard.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Uladzislau Rezki <urezki@gmail.com>, 
 Markus Probst <markus.probst@posteo.de>
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3382; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=NQkRap6CrOtYznHYWCc3/Rny1VeDCr57c/dGW/aAz94=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBq6gffg820DCEJGqOfFQcVV07bFl+sFBJgEuXJe
 7ZnMi1jofaJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCauoH3wAKCRAFzvXHieVa
 dG1EEADaK9wNwE4KDujDDlx6LnqQ0zT7FogvGIwBTyxcypD6WJhpR1sUIi9wOu2W4t2DLype9nf
 S2njGym0X35iibqvtVHVYyWXglFdOAQiTBJntKuizvXp4Wd7BRPFNxieqO+xz+wPozF7raUi0oc
 W/G0eaU7ghNnQPv0k7ro6547Wa0gpe02Y6/6UPpcd5sx9u7u2wl1decZEzudNSILc0GUMZhfiAi
 /u3lO1R1sFEEke+8E5ttTw64cmUczBrEdsM1/e097r/LCMjfLPlwSWW6Eus6NBiJTfwGdrvD3f5
 NodXdoKLSFWHUZeIhTfwN55dx9T0J0I57GABJxs0Q92HThf1USS9QrfB/L1oUkIvj6y9YPd+GNp
 BsiwGihTgb6pQhi+Rw3PkiQFEIIeOUUjR4zpexH3uUR2kZCVBP7qCa3c7IuCgxQC4O2bv+D81N/
 yWlcRluGh/7aLhoSM9/qD7OONXZSmXB2a+jfgpsxqKWFVylHSw2Z7kQsNFGr8GrP4e9U0JyWX4j
 u6pl+KpLPRwMHoWbB7Vh4AB/JfZylKJzw3rpk1uH2U8lQcS9CoNGqDJSl8fzOLW9aa5+SNrQiCS
 nDYc5VlNs+YUNAG81XdWfJmagiyy6I6O5hZRyaHh4FbL35uknhgpchguaAoo7MXvws9pcYFTt2l
 ttb/M6xVkWlqvzA==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

greybus_data_rcvd() finds the receiving connection by its host-side
CPort id. A host driver such as a software SVC sees only the remote end
of a connection, the interface id and the interface CPort id, and cannot
deliver data that way.

Add greybus_data_rcvd_by_intf(), which looks the connection up by
interface id and interface CPort id and passes the data to it.
It returns -EINVAL if no such connection exists. The first user is the
gb-softsvc driver, added later in this series.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 drivers/greybus/connection.c       | 47 ++++++++++++++++++++++++++++++++++++++
 include/linux/greybus/connection.h |  2 ++
 2 files changed, 49 insertions(+)

diff --git a/drivers/greybus/connection.c b/drivers/greybus/connection.c
index bd04485decb3..ce8646299ce8 100644
--- a/drivers/greybus/connection.c
+++ b/drivers/greybus/connection.c
@@ -69,6 +69,32 @@ gb_connection_hd_find(struct gb_host_device *hd, u16 cport_id)
 	return connection;
 }
 
+/*
+ * Returns a reference-counted pointer to the connection if found.
+ */
+static struct gb_connection *
+gb_connection_hd_find_by_intf(struct gb_host_device *hd, u8 intf_id,
+			      u16 intf_cport)
+{
+	struct gb_connection *connection;
+	unsigned long flags;
+
+	spin_lock_irqsave(&gb_connections_lock, flags);
+	list_for_each_entry(connection, &hd->connections, hd_links) {
+		if (connection->intf &&
+		    connection->intf->interface_id == intf_id &&
+		    connection->intf_cport_id == intf_cport) {
+			gb_connection_get(connection);
+			goto found;
+		}
+	}
+	connection = NULL;
+found:
+	spin_unlock_irqrestore(&gb_connections_lock, flags);
+
+	return connection;
+}
+
 /*
  * Callback from the host driver to let us know that data has been
  * received on the bundle.
@@ -91,6 +117,27 @@ void greybus_data_rcvd(struct gb_host_device *hd, u16 cport_id,
 }
 EXPORT_SYMBOL_GPL(greybus_data_rcvd);
 
+/*
+ * Callback from a host driver that only knows the remote end of a connection
+ * (interface id and interface CPort id), such as a software SVC.
+ */
+int greybus_data_rcvd_by_intf(struct gb_host_device *hd, u8 intf_id,
+			      u16 intf_cport, u8 *data, size_t length)
+{
+	struct gb_connection *connection;
+
+	trace_gb_hd_in(hd);
+
+	connection = gb_connection_hd_find_by_intf(hd, intf_id, intf_cport);
+	if (!connection)
+		return -EINVAL;
+	gb_connection_recv(connection, data, length);
+	gb_connection_put(connection);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(greybus_data_rcvd_by_intf);
+
 static void gb_connection_kref_release(struct kref *kref)
 {
 	struct gb_connection *connection;
diff --git a/include/linux/greybus/connection.h b/include/linux/greybus/connection.h
index d59b7fc1de3e..e8be67a936a6 100644
--- a/include/linux/greybus/connection.h
+++ b/include/linux/greybus/connection.h
@@ -92,6 +92,8 @@ void gb_connection_mode_switch_complete(struct gb_connection *connection);
 
 void greybus_data_rcvd(struct gb_host_device *hd, u16 cport_id,
 		       u8 *data, size_t length);
+int greybus_data_rcvd_by_intf(struct gb_host_device *hd, u8 intf_id,
+			      u16 intf_cport, u8 *data, size_t length);
 
 void gb_connection_latency_tag_enable(struct gb_connection *connection);
 void gb_connection_latency_tag_disable(struct gb_connection *connection);

-- 
2.56.0

